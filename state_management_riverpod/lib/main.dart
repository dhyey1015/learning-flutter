import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_management_riverpod/change_notifier%20_and_change_notifier_provider.dart';
import 'package:state_management_riverpod/future_provider.dart';
import 'package:state_management_riverpod/logger_riverpod.dart';
import 'package:state_management_riverpod/modifiers.dart';
import 'package:state_management_riverpod/provider.dart';
import 'package:state_management_riverpod/provider_stateful.dart';
import 'package:state_management_riverpod/state_notifier_and_state_notifier_provider.dart';
import 'package:state_management_riverpod/stream_provider.dart';
import 'package:state_management_riverpod/user_class.dart';
import 'package:http/http.dart' as http;
import 'package:state_management_riverpod/state_provider.dart';

part 'main.g.dart';

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
//provider-ref
final fetchUserProvider1 = FutureProvider<User>((ref) async {
  final fetchUser = ref.watch(fetchUserProvider3);
  return fetchUser.fetchUserData();
});

// 6) StreamProvider

final streamProvider = StreamProvider((ref) async* {
  yield [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
});

// Mofiiers

//1) .family, .autodispose
final fetchUserProvider2 =
    FutureProvider.family.autoDispose((ref, String input) async {
  final fetchUser1 = ref.watch(fetchUserProvider4);
  return fetchUser1.fetchUserData(input);
});

@riverpod
Future<User> fetchUser1(Ref ref, String input) {
  final fetchUser = ref.watch(fetchUserProvider3);
  return fetchUser.fetchUserData();
}
// there are 3 types of ref
//  1) WidgetRef
//  2) ProviderRef
// 3) Ref this ref is used in side the normal classes which does not extends
//    form state or something

// ref.keepAlive this method is used to keep a provider alive even if we dispose it
// ref.onDispose this methods let us do something after we dispose a provider
// ref.onCancel this is used whenever provider goes into a paused state that means
// its no longer being used for certain time or got disposed that time oncancel gets run
// ref.resume when ever your provider get resume what you want to do is added here
// ref.onAddListener ref.onRemoveListener

void main() {
  runApp(
    ProviderScope(
      observers: [LoggerRiverpod()],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FutureProviderClassModifiers(),
    );
  }
}
