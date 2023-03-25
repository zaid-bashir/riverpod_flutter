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
    final data = ref.watch(streamProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod"),
      ),
      body: Center(
        child: data.when(data: (data){
          return Text(data.toString(),style: const TextStyle(fontSize: 60,fontWeight: FontWeight.w900),);
        }, error: (error, stackTrace) {
          return Text(error.toString());
        }, loading: (){return const Center(child: CircularProgressIndicator(),);})
      ),
    );
  }
}
