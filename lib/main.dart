import 'package:flutter/material.dart';
import 'ui/dashboard.dart';
import 'ui/history.dart';
import 'ui/about.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'listBook',
      home: Dashboard(),
    );
  }
}
