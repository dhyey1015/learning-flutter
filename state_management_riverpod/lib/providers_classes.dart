import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_riverpod/main.dart';

//using ConsumerWidget
class ProvidersClasses extends ConsumerWidget {
  const ProvidersClasses({super.key});
  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Providers Classes'),
      ),
      body: Center(
        child: Text(name),
      ),
    );
  }
}

//using Consumer

class ProvidersClasses1 extends StatelessWidget {
  const ProvidersClasses1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Providers Classes'),
      ),
      body: Consumer(builder: (context, ref, child) {
        final name = ref.watch(nameProvider);
        return Center(
          child: Text(name),
        );
      }),
    );
  }
}
