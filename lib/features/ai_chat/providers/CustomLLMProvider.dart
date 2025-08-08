import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ai_toolkit/flutter_ai_toolkit.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class CustomLLMProvider extends LlmProvider with ChangeNotifier {
  final List<ChatMessage> _history = [];
  final void Function(Iterable<ChatMessage>)? _onComplete;

  CustomLLMProvider({void Function(Iterable<ChatMessage>)? onComplete})
      : _onComplete = onComplete;
  final String _apiUrl = '${dotenv.env['LLM_API']}';

  @override
  Stream<String> sendMessageStream(String prompt,
      {Iterable<Attachment> attachments = const []}) async* {
    final userMessage = ChatMessage.user(prompt, attachments);
    final llmMessage = ChatMessage.llm();
    _history.addAll([userMessage, llmMessage]);

    // try {
    final response = await http.post(
      Uri.parse(_apiUrl),
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'prompt': prompt}),
    );

    if (response.statusCode == 200) {
      final text = response.body.trim();
      llmMessage.append(text);
      yield text;

      _onComplete?.call(_history);
      notifyListeners();
    } else {
      yield '❌ Error ${response.statusCode}';
    }
    // } catch (e) {
    //   print("Error 2 $e   kooko");
    //   yield '❌ Exception: $e';
    // }
  }

  @override
  Stream<String> generateStream(String prompt,
      {Iterable<Attachment> attachments = const []}) {
    return sendMessageStream(prompt, attachments: attachments);
  }

  @override
  Iterable<ChatMessage> get history => _history;

  @override
  set history(Iterable<ChatMessage> history) {
    _history
      ..clear()
      ..addAll(history);
    notifyListeners();
  }
}
