import 'package:flutter/material.dart';
import '../widget/sidebar.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(title: Text('History')),
      body: Center(
        child: Text("Ini Halaman History !"),
      ),
    );
  }
}
