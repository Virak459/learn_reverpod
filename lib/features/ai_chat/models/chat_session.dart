import 'package:uuid/uuid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_ai_toolkit/flutter_ai_toolkit.dart';

part 'chat_session.freezed.dart';
part 'chat_session.g.dart';

@freezed
abstract class ChatSessionMessage with _$ChatSessionMessage {
  @JsonSerializable(fieldRename: FieldRename.snake) // ignore: invalid_annotation_target
  const factory ChatSessionMessage({
    required String id,
    required String content,
    required bool isUser,
    required DateTime timestamp,
  }) = _ChatSessionMessage;

  factory ChatSessionMessage.create({
    required String content,
    required bool isUser,
  }) => ChatSessionMessage(
    id: const Uuid().v4(),
    content: content,
    isUser: isUser,
    timestamp: DateTime.now(),
  );

  factory ChatSessionMessage.fromJson(Map<String, dynamic> json) => _$ChatSessionMessageFromJson(json);
}

@freezed
abstract class LocalChatSession with _$LocalChatSession {
  @JsonSerializable(fieldRename: FieldRename.snake) // ignore: invalid_annotation_target
  const factory LocalChatSession({
    required String id,
    required String title,
    required Iterable<ChatMessage> history,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _LocalChatSession;

  factory LocalChatSession.create({
    required String title,
  }) => LocalChatSession(
    id: const Uuid().v4(),
    title: title,
    history: const [],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  factory LocalChatSession.fromJson(Map<String, dynamic> json) => _$LocalChatSessionFromJson(json);
}