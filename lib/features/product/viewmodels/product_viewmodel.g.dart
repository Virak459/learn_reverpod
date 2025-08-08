// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addProductHash() => r'4c886a3cb560539c975060a5fd5caf89e74d4577';

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

/// See also [addProduct].
@ProviderFor(addProduct)
const addProductProvider = AddProductFamily();

/// See also [addProduct].
class AddProductFamily extends Family<AsyncValue<void>> {
  /// See also [addProduct].
  const AddProductFamily();

  /// See also [addProduct].
  AddProductProvider call(
    ProductModel product,
    String token,
    XFile? pickedFile,
  ) {
    return AddProductProvider(product, token, pickedFile);
  }

  @override
  AddProductProvider getProviderOverride(
    covariant AddProductProvider provider,
  ) {
    return call(provider.product, provider.token, provider.pickedFile);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'addProductProvider';
}

/// See also [addProduct].
class AddProductProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addProduct].
  AddProductProvider(ProductModel product, String token, XFile? pickedFile)
    : this._internal(
        (ref) => addProduct(ref as AddProductRef, product, token, pickedFile),
        from: addProductProvider,
        name: r'addProductProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$addProductHash,
        dependencies: AddProductFamily._dependencies,
        allTransitiveDependencies: AddProductFamily._allTransitiveDependencies,
        product: product,
        token: token,
        pickedFile: pickedFile,
      );

  AddProductProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.product,
    required this.token,
    required this.pickedFile,
  }) : super.internal();

  final ProductModel product;
  final String token;
  final XFile? pickedFile;

  @override
  Override overrideWith(
    FutureOr<void> Function(AddProductRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddProductProvider._internal(
        (ref) => create(ref as AddProductRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        product: product,
        token: token,
        pickedFile: pickedFile,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddProductProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddProductProvider &&
        other.product == product &&
        other.token == token &&
        other.pickedFile == pickedFile;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, product.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);
    hash = _SystemHash.combine(hash, pickedFile.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddProductRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `product` of this provider.
  ProductModel get product;

  /// The parameter `token` of this provider.
  String get token;

  /// The parameter `pickedFile` of this provider.
  XFile? get pickedFile;
}

class _AddProductProviderElement extends AutoDisposeFutureProviderElement<void>
    with AddProductRef {
  _AddProductProviderElement(super.provider);

  @override
  ProductModel get product => (origin as AddProductProvider).product;
  @override
  String get token => (origin as AddProductProvider).token;
  @override
  XFile? get pickedFile => (origin as AddProductProvider).pickedFile;
}

String _$getProductHash() => r'582bd6c4d1d58d448b5bc1c04afc98163c4c4cf9';

/// See also [getProduct].
@ProviderFor(getProduct)
final getProductProvider = AutoDisposeFutureProvider<ProductModel>.internal(
  getProduct,
  name: r'getProductProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getProductHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetProductRef = AutoDisposeFutureProviderRef<ProductModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
