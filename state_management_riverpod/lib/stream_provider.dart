import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_riverpod/main.dart';

class StreamProviderClass extends ConsumerWidget {
  const StreamProviderClass({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stream = ref.watch(streamProvider);
    return stream.when(data: (data) {
      return Scaffold(
        body: Center(
          child: Text(data.toString()),
        ),
      );
    }, error: (error, stackTrace) {
      return Scaffold(
        body: Center(
          child: Text(error.toString()),
        ),
      );
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
