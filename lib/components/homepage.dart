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
    final listOfUsers = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod"),
      ),
      body: Center(
        child: listOfUsers.when(data: (users){
          return ListView.builder(itemBuilder: (context,index){
            return ListTile(
              title: Text("${users[index].firstName!} ${users[index].firstName!}"),
              subtitle: Text(users[index].email!),
              leading: CircleAvatar(backgroundImage: NetworkImage(users[index].avatar!)),
            );
          },itemCount: users.length,);
        }, error: (error, stackTrace) {
          return AlertDialog(
            title: Text(error.toString()),
            content: Text(stackTrace.toString()),
          );
        }, loading: (){return const Center(child: CircularProgressIndicator(),);}),
      ),
    );
  }
}
