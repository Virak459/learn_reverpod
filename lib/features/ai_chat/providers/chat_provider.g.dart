// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatBoxHash() => r'4112a3872874955469b7d9b06b4f7af0a6bd61fa';

/// See also [chatBox].
@ProviderFor(chatBox)
final chatBoxProvider = AutoDisposeFutureProvider<Box<String>>.internal(
  chatBox,
  name: r'chatBoxProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chatBoxHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ChatBoxRef = AutoDisposeFutureProviderRef<Box<String>>;
String _$localChatSessionsHash() => r'937bb3a9402b51d815ff2272462b1769006e879e';

/// See also [localChatSessions].
@ProviderFor(localChatSessions)
final localChatSessionsProvider =
    AutoDisposeFutureProvider<List<LocalChatSession>>.internal(
  localChatSessions,
  name: r'localChatSessionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$localChatSessionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LocalChatSessionsRef
    = AutoDisposeFutureProviderRef<List<LocalChatSession>>;
String _$geminiHash() => r'5ab606b994c4000cfa566087d2e8279590b49d90';

/// See also [gemini].
@ProviderFor(gemini)
final geminiProvider = AutoDisposeProvider<CustomGeminiProvider>.internal(
  gemini,
  name: r'geminiProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$geminiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GeminiRef = AutoDisposeProviderRef<CustomGeminiProvider>;
String _$ai_localHash() => r'3aba140550a36a06bc6a979adb44883d3a4097dd';

/// See also [ai_local].
@ProviderFor(ai_local)
final ai_localProvider = AutoDisposeProvider<CustomLLMProvider>.internal(
  ai_local,
  name: r'ai_localProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ai_localHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef Ai_localRef = AutoDisposeProviderRef<CustomLLMProvider>;
String _$selectedSessionHash() => r'1da57b92e2fa8cbaa60832aee6cd82682224924f';

/// See also [SelectedSession].
@ProviderFor(SelectedSession)
final selectedSessionProvider =
    AutoDisposeNotifierProvider<SelectedSession, LocalChatSession>.internal(
  SelectedSession.new,
  name: r'selectedSessionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedSessionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedSession = AutoDisposeNotifier<LocalChatSession>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
