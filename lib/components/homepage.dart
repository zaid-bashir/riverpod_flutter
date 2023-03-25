import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../main.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  @override
  Widget build(BuildContext context) {
    final counterProviderObj = ref.watch(counterProvider);
    ref.listen(counterProvider, (previous, next) {
      if(next == 4){
        if (kDebugMode) {
          print("Hello");
        }
      }
     });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(counterProviderObj.toString()),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).increment();
              },
              child: const Text("Counter"),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                ref.invalidate(counterProvider);
              },
              child: const Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
