import 'package:flutter/material.dart';
import '../widget/sidebar.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(title: Text('Dashboard')),
      body: Center(
        child: Text("Selamat Datang di Dashboard !"),
      ),
    );
  }
}
