import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_riverpod/main.dart';

class StateProviderClass extends ConsumerWidget {
  const StateProviderClass({super.key});

  void onSubmit(WidgetRef ref, String value) {
    ref.read(nameProvide1.notifier).update((state) => value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvide1) ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: TextField(
          onSubmitted: (value) {
            onSubmit(ref, value);
          },
        ),
      ),
    );
  }
}
