import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/homepage.dart';

final keyValueProvider = Provider<Map>((ref) {
  return {
    "Name": "Zaid Bashir",
    "Age": 23,
    "Address": "Sopore J&K",
    "Profession": "SDE1 @ TrueMedix"
  };
});

final counterProvider = StateProvider<int>((ref) {
  return 0;
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
