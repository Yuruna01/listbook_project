import 'package:flutter/material.dart';
import '../widget/sidebar.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(title: Text('About')),
      body: Center(
        child: Text("Ini Halaman About !"),
      ),
    );
  }
}
