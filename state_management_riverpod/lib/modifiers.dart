// this for implementations of famliy modifier it can take only one input
// .autodispose prevents memory leaks in application and it will auto dispose
// your provider
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_riverpod/main.dart';

class FutureProviderClassModifiers extends ConsumerStatefulWidget {
  const FutureProviderClassModifiers({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FutureProviderClassModifiersState();
}

//family modifier
class _FutureProviderClassModifiersState
    extends ConsumerState<FutureProviderClassModifiers> {
  String userNo = '1';
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(fetchUserProvider2(userNo));
    return user.when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            title: Column(
              children: [
                TextField(
                  onSubmitted: (value) => setState(() {
                    userNo = value;
                  }),
                )
              ],
            ),
          ),
          body: Text(data.name.toString()),
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
