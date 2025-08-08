// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatSessionMessage {
  String get id;
  String get content;
  bool get isUser;
  DateTime get timestamp;

  /// Create a copy of ChatSessionMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatSessionMessageCopyWith<ChatSessionMessage> get copyWith =>
      _$ChatSessionMessageCopyWithImpl<ChatSessionMessage>(
          this as ChatSessionMessage, _$identity);

  /// Serializes this ChatSessionMessage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatSessionMessage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isUser, isUser) || other.isUser == isUser) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, content, isUser, timestamp);

  @override
  String toString() {
    return 'ChatSessionMessage(id: $id, content: $content, isUser: $isUser, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class $ChatSessionMessageCopyWith<$Res> {
  factory $ChatSessionMessageCopyWith(
          ChatSessionMessage value, $Res Function(ChatSessionMessage) _then) =
      _$ChatSessionMessageCopyWithImpl;
  @useResult
  $Res call({String id, String content, bool isUser, DateTime timestamp});
}

/// @nodoc
class _$ChatSessionMessageCopyWithImpl<$Res>
    implements $ChatSessionMessageCopyWith<$Res> {
  _$ChatSessionMessageCopyWithImpl(this._self, this._then);

  final ChatSessionMessage _self;
  final $Res Function(ChatSessionMessage) _then;

  /// Create a copy of ChatSessionMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? isUser = null,
    Object? timestamp = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isUser: null == isUser
          ? _self.isUser
          : isUser // ignore: cast_nullable_to_non_nullable
              as bool,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ChatSessionMessage implements ChatSessionMessage {
  const _ChatSessionMessage(
      {required this.id,
      required this.content,
      required this.isUser,
      required this.timestamp});
  factory _ChatSessionMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatSessionMessageFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final bool isUser;
  @override
  final DateTime timestamp;

  /// Create a copy of ChatSessionMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatSessionMessageCopyWith<_ChatSessionMessage> get copyWith =>
      __$ChatSessionMessageCopyWithImpl<_ChatSessionMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatSessionMessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatSessionMessage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isUser, isUser) || other.isUser == isUser) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, content, isUser, timestamp);

  @override
  String toString() {
    return 'ChatSessionMessage(id: $id, content: $content, isUser: $isUser, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class _$ChatSessionMessageCopyWith<$Res>
    implements $ChatSessionMessageCopyWith<$Res> {
  factory _$ChatSessionMessageCopyWith(
          _ChatSessionMessage value, $Res Function(_ChatSessionMessage) _then) =
      __$ChatSessionMessageCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String content, bool isUser, DateTime timestamp});
}

/// @nodoc
class __$ChatSessionMessageCopyWithImpl<$Res>
    implements _$ChatSessionMessageCopyWith<$Res> {
  __$ChatSessionMessageCopyWithImpl(this._self, this._then);

  final _ChatSessionMessage _self;
  final $Res Function(_ChatSessionMessage) _then;

  /// Create a copy of ChatSessionMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? isUser = null,
    Object? timestamp = null,
  }) {
    return _then(_ChatSessionMessage(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isUser: null == isUser
          ? _self.isUser
          : isUser // ignore: cast_nullable_to_non_nullable
              as bool,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$LocalChatSession {
  String get id;
  String get title;
  Iterable<ChatMessage> get history;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of LocalChatSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocalChatSessionCopyWith<LocalChatSession> get copyWith =>
      _$LocalChatSessionCopyWithImpl<LocalChatSession>(
          this as LocalChatSession, _$identity);

  /// Serializes this LocalChatSession to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocalChatSession &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other.history, history) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title,
      const DeepCollectionEquality().hash(history), createdAt, updatedAt);

  @override
  String toString() {
    return 'LocalChatSession(id: $id, title: $title, history: $history, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $LocalChatSessionCopyWith<$Res> {
  factory $LocalChatSessionCopyWith(
          LocalChatSession value, $Res Function(LocalChatSession) _then) =
      _$LocalChatSessionCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      Iterable<ChatMessage> history,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$LocalChatSessionCopyWithImpl<$Res>
    implements $LocalChatSessionCopyWith<$Res> {
  _$LocalChatSessionCopyWithImpl(this._self, this._then);

  final LocalChatSession _self;
  final $Res Function(LocalChatSession) _then;

  /// Create a copy of LocalChatSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? history = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      history: null == history
          ? _self.history
          : history // ignore: cast_nullable_to_non_nullable
              as Iterable<ChatMessage>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _LocalChatSession implements LocalChatSession {
  const _LocalChatSession(
      {required this.id,
      required this.title,
      required this.history,
      required this.createdAt,
      required this.updatedAt});
  factory _LocalChatSession.fromJson(Map<String, dynamic> json) =>
      _$LocalChatSessionFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final Iterable<ChatMessage> history;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of LocalChatSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocalChatSessionCopyWith<_LocalChatSession> get copyWith =>
      __$LocalChatSessionCopyWithImpl<_LocalChatSession>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LocalChatSessionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocalChatSession &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other.history, history) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title,
      const DeepCollectionEquality().hash(history), createdAt, updatedAt);

  @override
  String toString() {
    return 'LocalChatSession(id: $id, title: $title, history: $history, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$LocalChatSessionCopyWith<$Res>
    implements $LocalChatSessionCopyWith<$Res> {
  factory _$LocalChatSessionCopyWith(
          _LocalChatSession value, $Res Function(_LocalChatSession) _then) =
      __$LocalChatSessionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      Iterable<ChatMessage> history,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$LocalChatSessionCopyWithImpl<$Res>
    implements _$LocalChatSessionCopyWith<$Res> {
  __$LocalChatSessionCopyWithImpl(this._self, this._then);

  final _LocalChatSession _self;
  final $Res Function(_LocalChatSession) _then;

  /// Create a copy of LocalChatSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? history = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_LocalChatSession(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      history: null == history
          ? _self.history
          : history // ignore: cast_nullable_to_non_nullable
              as Iterable<ChatMessage>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
