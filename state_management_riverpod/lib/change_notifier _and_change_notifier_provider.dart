import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_riverpod/main.dart';
import 'package:state_management_riverpod/user_class.dart';

class ChangeNotifierAndProviderClass extends ConsumerWidget {
  const ChangeNotifierAndProviderClass({super.key});

  void onSubmitName(WidgetRef ref, String value) {
    ref.read(userProvider1).updateName(value);
  }

  void onSubmitAge(WidgetRef ref, String value) {
    ref.read(userProvider1).updateAge(value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider1);
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
              onSubmitted: (value) => onSubmitName(ref, value),
            ),
            TextField(
              onSubmitted: (value) => onSubmitAge(ref, value),
            ),
          ],
        ),
      ),
    );
  }
}
