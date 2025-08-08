import 'package:flutter/foundation.dart';
import 'package:flutter_ai_toolkit/flutter_ai_toolkit.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class CustomGeminiProvider extends LlmProvider with ChangeNotifier {
  /// Creates a new instance of [GeminiProvider].
  ///
  /// [model] is an optional [GenerativeModel] instance for text generation. If
  /// provided, it will be used for chat-based interactions and text generation.
  ///
  /// [history] is an optional list of previous chat messages to initialize the
  /// chat session with.
  ///
  /// [chatSafetySettings] is an optional list of safety settings to apply to
  /// the model's responses.
  ///
  /// [chatGenerationConfig] is an optional configuration for controlling the
  /// model's generation behavior.
  CustomGeminiProvider({
    required GenerativeModel model,
    Iterable<ChatMessage>? history,
    List<SafetySetting>? chatSafetySettings,
    GenerationConfig? chatGenerationConfig,
    void Function(Iterable<ChatMessage> history)? onComplete,
  }) : _model = model,
       _history = history?.toList() ?? [],
       _chatSafetySettings = chatSafetySettings,
       _onComplete = onComplete,
       _chatGenerationConfig = chatGenerationConfig {
    _chat = _startChat(history);
  }

  final GenerativeModel _model;
  final List<SafetySetting>? _chatSafetySettings;
  final GenerationConfig? _chatGenerationConfig;
  final List<ChatMessage> _history;
  final void Function(Iterable<ChatMessage> history)? _onComplete;
  ChatSession? _chat;

  @override
  Stream<String> generateStream(
    String prompt, {
    Iterable<Attachment> attachments = const [],
  }) => _generateStream(
    prompt: prompt,
    attachments: attachments,
    contentStreamGenerator: (c) => _model.generateContentStream([c]),
  );

  @override
  Stream<String> sendMessageStream(
    String prompt, {
    Iterable<Attachment> attachments = const [],
  }) async* {
    final userMessage = ChatMessage.user(prompt, attachments);
    final llmMessage = ChatMessage.llm();
    _history.addAll([userMessage, llmMessage]);

    final response = _generateStream(
      prompt: prompt,
      attachments: attachments,
      contentStreamGenerator: _chat!.sendMessageStream,
    );

    // don't write this code if you're targeting the web until this is fixed:
    // https://github.com/dart-lang/sdk/issues/47764
    // await for (final chunk in response) {
    //   llmMessage.append(chunk);
    //   yield chunk;
    // }
    yield* response.map((chunk) {
      llmMessage.append(chunk);
      return chunk;
    });

    // notify listeners that the history has changed when response is complete
    _onComplete?.call(_history);
    notifyListeners();
  }

  Stream<String> _generateStream({
    required String prompt,
    required Iterable<Attachment> attachments,
    required Stream<GenerateContentResponse> Function(Content)
    contentStreamGenerator,
  }) async* {
    final content = Content('user', [
      TextPart(prompt),
      ...attachments.map(_partFrom),
    ]);

    final response = contentStreamGenerator(content);
    // don't write this code if you're targeting the web until this is fixed:
    // https://github.com/dart-lang/sdk/issues/47764
    // await for (final chunk in response) {
    //   final text = chunk.text;
    //   if (text != null) yield text;
    // }
    yield* response
        .map((chunk) => chunk.text)
        .where((text) => text != null)
        .cast<String>();
  }

  @override
  Iterable<ChatMessage> get history => _history;

  @override
  set history(Iterable<ChatMessage> history) {
    _history.clear();
    _history.addAll(history);
    _chat = _startChat(history);
    notifyListeners();
  }

  ChatSession? _startChat(Iterable<ChatMessage>? history) => _model.startChat(
    history: history?.map(_contentFrom).toList(),
    safetySettings: _chatSafetySettings,
    generationConfig: _chatGenerationConfig,
  );

  static Part _partFrom(Attachment attachment) => switch (attachment) {
    (final FileAttachment a) => DataPart(a.mimeType, a.bytes),
    (final LinkAttachment a) => FilePart(a.url),
  };

  static Content _contentFrom(ChatMessage message) => Content(
    message.origin.isUser ? 'user' : 'model',
    [TextPart(message.text ?? ''), ...message.attachments.map(_partFrom)],
  );
}
