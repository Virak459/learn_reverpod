import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_reverpod/features/ai_chat/providers/CustomLLMProvider.dart';
import '../models/chat_session.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'llm_provider.dart';
part 'chat_provider.g.dart';

final logger = Logger();

// Exported for use in main.dart
const String chatBoxName = 'chat_sessions';

@riverpod
Future<Box<String>> chatBox(Ref ref) async {
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  return await Hive.openBox<String>(chatBoxName);
}

@riverpod
Future<List<LocalChatSession>> localChatSessions(Ref ref) async {
  final chatBox = await ref.watch(chatBoxProvider.future);

  final sessions = chatBox
      .toMap()
      .values
      .map((e) => LocalChatSession.fromJson(json.decode(e)))
      .toList();

  sessions.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

  return sessions;
}

@riverpod
class SelectedSession extends _$SelectedSession {
  @override
  LocalChatSession build() {
    return LocalChatSession.create(title: 'New Chat');
  }

  void setSession(LocalChatSession session) {
    state = session;
  }
}

@riverpod
CustomGeminiProvider gemini(Ref ref) {
  final selectedSession = ref.watch(selectedSessionProvider);
  return CustomGeminiProvider(
    model: GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: dotenv.env['GEMINI_API_KEY']!,
    ),
    history: selectedSession.history,
    onComplete: (history) {
      logger.d('saving session');
      ref
          .read(chatBoxProvider.future)
          .then(
            (value) => value.put(
              selectedSession.id,
              jsonEncode(selectedSession.copyWith(history: history).toJson()),
            ),
          );
      ref.invalidate(localChatSessionsProvider);
    },
  );
}

@riverpod
CustomLLMProvider ai_local(Ref ref) {
  final selectedSession = ref.watch(selectedSessionProvider);
  return CustomLLMProvider(
    onComplete: (history) {
      logger.d('saving session');
      // Save logic here
    },
  )..history = selectedSession.history;
}
