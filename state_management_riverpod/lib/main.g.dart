// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchUser1Hash() => r'78ede238bfff5a6c290fb155a545044157fb149a';

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

/// See also [fetchUser1].
@ProviderFor(fetchUser1)
const fetchUser1Provider = FetchUser1Family();

/// See also [fetchUser1].
class FetchUser1Family extends Family<AsyncValue<User>> {
  /// See also [fetchUser1].
  const FetchUser1Family();

  /// See also [fetchUser1].
  FetchUser1Provider call(
    String input,
  ) {
    return FetchUser1Provider(
      input,
    );
  }

  @override
  FetchUser1Provider getProviderOverride(
    covariant FetchUser1Provider provider,
  ) {
    return call(
      provider.input,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchUser1Provider';
}

/// See also [fetchUser1].
class FetchUser1Provider extends AutoDisposeFutureProvider<User> {
  /// See also [fetchUser1].
  FetchUser1Provider(
    String input,
  ) : this._internal(
          (ref) => fetchUser1(
            ref as FetchUser1Ref,
            input,
          ),
          from: fetchUser1Provider,
          name: r'fetchUser1Provider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchUser1Hash,
          dependencies: FetchUser1Family._dependencies,
          allTransitiveDependencies:
              FetchUser1Family._allTransitiveDependencies,
          input: input,
        );

  FetchUser1Provider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.input,
  }) : super.internal();

  final String input;

  @override
  Override overrideWith(
    FutureOr<User> Function(FetchUser1Ref provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchUser1Provider._internal(
        (ref) => create(ref as FetchUser1Ref),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        input: input,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<User> createElement() {
    return _FetchUser1ProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchUser1Provider && other.input == input;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, input.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchUser1Ref on AutoDisposeFutureProviderRef<User> {
  /// The parameter `input` of this provider.
  String get input;
}

class _FetchUser1ProviderElement extends AutoDisposeFutureProviderElement<User>
    with FetchUser1Ref {
  _FetchUser1ProviderElement(super.provider);

  @override
  String get input => (origin as FetchUser1Provider).input;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
