import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                int data = ref.watch(counterProvider);
                return Text(data.toString());
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Consumer(
              builder: (context, ref, child) {
                return ElevatedButton(
                  onPressed: () {
                    ref
                        .read(counterProvider.notifier)
                        .update((state) => state + 1);
                  },
                  child: const Text("Counter"),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Consumer(
              builder: (context, ref, child) {
                return ElevatedButton(
                  onPressed: () {
                    ref.invalidate(counterProvider);
                  },
                  child: const Text("Reset"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class HomePage extends ConsumerStatefulWidget {
//   const HomePage({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
// }

// class _HomePageState extends ConsumerState<HomePage> {

//   @override
//   void initState() {
//     super.initState();
//     // if (kDebugMode) {
//     //   print("App Started...");
//     //   Map<dynamic,dynamic> dataPer = ref.read(keyValueProvider);
//     //   print(dataPer.toString());
//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Map<dynamic,dynamic> data = ref.watch(keyValueProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Riverpod Flutter"),
//       ),
//       body:  Center(
//         child: Text(data.toString()),
//       ),
//     );
//   }
// }