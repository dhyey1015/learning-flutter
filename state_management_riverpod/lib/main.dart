import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_riverpod/provider.dart';
import 'package:state_management_riverpod/provider_stateful.dart';
import 'package:state_management_riverpod/state_provider.dart';
//1) Provider

final nameProvider = Provider((ref) {
  return 'dhyey kakadiya';
});

final nameProvide1 = StateProvider<String?>((ref) {
  return null;
});

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StateProviderClass(),
    );
  }
}
