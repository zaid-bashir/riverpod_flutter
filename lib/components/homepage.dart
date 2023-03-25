import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/main.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  @override
  Widget build(BuildContext context) {
    int data = ref.watch(counterProvider);
    ref.listen(counterProvider,((prev,next){
      if(next == 7){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Value Reached"),),);
      }
       if(next == 0){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Value Resetted"),),);
      }
    }));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data.toString()),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).update((state) => state + 1);
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
