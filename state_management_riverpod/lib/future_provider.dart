import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_riverpod/main.dart';

class FutureProviderClass extends ConsumerWidget {
  const FutureProviderClass({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(fetchUserProvider);
    return user.when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            title: Column(
              children: [
                Text(data.name.toString()),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return Scaffold(
          body: Center(
            child: Text(
              error.toString(),
            ),
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
