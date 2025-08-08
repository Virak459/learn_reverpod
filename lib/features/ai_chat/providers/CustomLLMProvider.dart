import 'dart:convert';
import 'dart:typed_data';

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

    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };

    final request = http.Request(
      'POST',
      Uri.parse("${dotenv.env['LLM_API']}"),
    );
    request.body = json.encode({"prompt": prompt});
    request.headers.addAll(headers);

    try {
      final response = await request.send();

      // ✅ Read the stream only ONCE
      final responseText = await response.stream.bytesToString();
      print("Response 1 : $responseText");

      if (response.statusCode == 200 || response.statusCode == 201) {
        // ✅ Handle the response
        llmMessage.append(responseText);
        yield responseText;

        _onComplete?.call(_history);
        notifyListeners();
      } else {
        final errorMsg = '❌ Error: ${response.statusCode}';
        llmMessage.append(errorMsg);
        notifyListeners();
        yield errorMsg;
      }
    } catch (e) {
      print("Parsing or stream error: $e");
      llmMessage.append('❌ Exception: $e');
      notifyListeners();
      yield '❌ Exception: $e';
      throw LlmFailureException("Response parse failed");
    }
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

  String extractBase64(String response) {
    final regex = RegExp(r'data:image\/png;base64,([A-Za-z0-9+/=]+)');
    final match = regex.firstMatch(response);
    return match != null ? match.group(1)! : '';
  }

  Uint8List base64ToImage(String base64String) {
    return base64Decode(base64String);
  }
}
