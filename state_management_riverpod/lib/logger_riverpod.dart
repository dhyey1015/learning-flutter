import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoggerRiverpod extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider, // this is base class for all providers
    Object? previousValue, // tells use previous value of our provider
    Object? newValue, // tells us new value of provider
    ProviderContainer container, // this is used inside the ProviderScope as it
    //made up of ProviderContainer
  ) {
    super.didUpdateProvider(provider, previousValue, newValue, container);
    print('$provider, $previousValue, $newValue, $container');
  }

  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value,
      ProviderContainer container) {
    super.didAddProvider(provider, value, container);
  }

  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider, ProviderContainer container) {
    super.didDisposeProvider(provider, container);
  }
}
