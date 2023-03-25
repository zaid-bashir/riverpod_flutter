import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/model/usermodel.dart';
import 'package:riverpod_flutter/service/api_service.dart';

import 'components/homepage.dart';

final apiProvider = Provider<ApiService>((ref){ return ApiService();});

final userDataProvider = FutureProvider<List<UserModel>>((ref){
  return ref.read(apiProvider).getUsers();
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Flutter',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomePage(),
    );
  }
}
