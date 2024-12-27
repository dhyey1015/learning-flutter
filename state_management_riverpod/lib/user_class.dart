// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

@immutable
class User {
  final String name;
  final int? age;
  final String email;
  const User({
    required this.name,
    this.age,
    required this.email,
  });

  User copyWith({
    String? name,
    int? age,
    String? email,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      age:
          map['age'] != null ? map['age'] as int : null, // Handle missing `age`
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(name: $name, age: $age, email: $email)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name && other.age == age && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode ^ email.hashCode;
}

class UserStateNotifier extends StateNotifier<User> {
  UserStateNotifier(super.state);

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateAge(String age) {
    state = state.copyWith(age: int.parse(age));
  }
}

//class for ChangeProvider

class UserChangeNotifier extends ChangeNotifier {
  User user = const User(name: '', age: 0, email: '');

  String get name => user.name; // Getter for name
  int? get age => user.age;

  void updateName(String name) {
    user = user.copyWith(name: name);
    notifyListeners();
  }

  void updateAge(String age) {
    user = user.copyWith(age: int.parse(age));
    notifyListeners();
  }
}
// provider-ref

final fetchUserProvider3 = Provider((ref) => FetchUser());

class FetchUser {
  Future<User> fetchUserData() async {
    const url = 'https://jsonplaceholder.typicode.com/users/1/';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return User.fromJson(response.body);
    } else {
      throw Exception('Failed to load user data');
    }
  }
}

// for modifiers

final fetchUserProvider4 = Provider((ref) => FetchUser1());

class FetchUser1 {
  Future<User> fetchUserData(String input) async {
    var url = 'https://jsonplaceholder.typicode.com/users/$input';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return User.fromJson(response.body);
    } else {
      throw Exception('Failed to load user data');
    }
  }
}

class FetchUser2 extends StateNotifier<bool> {
  FetchUser2() : super(false);
  final TextEditingController controller = TextEditingController();
  Future<User> fetchUserData(String input) async {
    var url = 'https://jsonplaceholder.typicode.com/users/$input';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return User.fromJson(response.body);
    } else {
      throw Exception('Failed to load user data');
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
