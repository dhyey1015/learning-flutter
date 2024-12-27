import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_riverpod/main.dart';

class StateNotifierAndProvider extends ConsumerWidget {
  const StateNotifierAndProvider({super.key});

  void onSubmit(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateName(value);
  }

  void onSubmit1(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateAge(value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(user.name),
            Text(user.age.toString()),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              onSubmitted: (value) => onSubmit(ref, value),
            ),
            TextField(
              onSubmitted: (value) => onSubmit1(ref, value),
            )
          ],
        ),
      ),
    );
  }
}
