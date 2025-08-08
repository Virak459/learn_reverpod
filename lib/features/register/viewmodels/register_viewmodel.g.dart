// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$registerHash() => r'e845c75b33b9270b1bdacd49bfe0e32e2ae05067';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [register].
@ProviderFor(register)
const registerProvider = RegisterFamily();

/// See also [register].
class RegisterFamily extends Family<AsyncValue<UserModel>> {
  /// See also [register].
  const RegisterFamily();

  /// See also [register].
  RegisterProvider call(RegisterModel registerModel) {
    return RegisterProvider(registerModel);
  }

  @override
  RegisterProvider getProviderOverride(covariant RegisterProvider provider) {
    return call(provider.registerModel);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'registerProvider';
}

/// See also [register].
class RegisterProvider extends AutoDisposeFutureProvider<UserModel> {
  /// See also [register].
  RegisterProvider(RegisterModel registerModel)
    : this._internal(
        (ref) => register(ref as RegisterRef, registerModel),
        from: registerProvider,
        name: r'registerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$registerHash,
        dependencies: RegisterFamily._dependencies,
        allTransitiveDependencies: RegisterFamily._allTransitiveDependencies,
        registerModel: registerModel,
      );

  RegisterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.registerModel,
  }) : super.internal();

  final RegisterModel registerModel;

  @override
  Override overrideWith(
    FutureOr<UserModel> Function(RegisterRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RegisterProvider._internal(
        (ref) => create(ref as RegisterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        registerModel: registerModel,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UserModel> createElement() {
    return _RegisterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RegisterProvider && other.registerModel == registerModel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, registerModel.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RegisterRef on AutoDisposeFutureProviderRef<UserModel> {
  /// The parameter `registerModel` of this provider.
  RegisterModel get registerModel;
}

class _RegisterProviderElement
    extends AutoDisposeFutureProviderElement<UserModel>
    with RegisterRef {
  _RegisterProviderElement(super.provider);

  @override
  RegisterModel get registerModel => (origin as RegisterProvider).registerModel;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
