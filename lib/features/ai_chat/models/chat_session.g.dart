// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatSessionMessage _$ChatSessionMessageFromJson(Map<String, dynamic> json) =>
    _ChatSessionMessage(
      id: json['id'] as String,
      content: json['content'] as String,
      isUser: json['is_user'] as bool,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$ChatSessionMessageToJson(_ChatSessionMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'is_user': instance.isUser,
      'timestamp': instance.timestamp.toIso8601String(),
    };

_LocalChatSession _$LocalChatSessionFromJson(Map<String, dynamic> json) =>
    _LocalChatSession(
      id: json['id'] as String,
      title: json['title'] as String,
      history: (json['history'] as List<dynamic>)
          .map((e) => ChatMessage.fromJson(e as Map<String, dynamic>)),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$LocalChatSessionToJson(_LocalChatSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'history': instance.history.toList(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
