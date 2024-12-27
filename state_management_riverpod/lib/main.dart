import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_riverpod/change_notifier%20_and_change_notifier_provider.dart';
import 'package:state_management_riverpod/future_provider.dart';
import 'package:state_management_riverpod/provider.dart';
import 'package:state_management_riverpod/provider_stateful.dart';
import 'package:state_management_riverpod/state_notifier_and_state_notifier_provider.dart';
import 'package:state_management_riverpod/user_class.dart';
import 'package:http/http.dart' as http;
import 'package:state_management_riverpod/state_provider.dart';

//1) Provider
final nameProvider = Provider((ref) {
  return 'dhyey kakadiya';
});
//2) StateProvider
final nameProvide1 = StateProvider<String?>((ref) {
  return null;
});
//3) StateNotifier and StateNotifierProvider
final userProvider = StateNotifierProvider<UserStateNotifier, User>(
  (ref) => UserStateNotifier(
    const User(name: "", age: 0, email: ""),
  ),
);

//4) ChangeNotifier and ChangeNotifierProvider
final userProvider1 = ChangeNotifierProvider((ref) => UserChangeNotifier());

//5) FutureProvider
final fetchUserProvider = FutureProvider<User>((ref) async {
  const url = 'https://jsonplaceholder.typicode.com/users/1/';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return User.fromJson(response.body);
  } else {
    throw Exception('Failed to load user data');
  }
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
      home: FutureProviderClass(),
    );
  }
}
