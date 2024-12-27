import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_riverpod/main.dart';

class RefSelectMethod extends ConsumerWidget {
  const RefSelectMethod({super.key});

  void onSubmit(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateName(value);
  }

  void onSubmit1(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateAge(value);
  }

  //select do a thing it will only rebuild when the user name chnages because it
  // inside the watch method provided by ref
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final userSelect = ref.watch(userProvider.select((value) => value.name));
    //we can also do
    // userProvider.select()
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
