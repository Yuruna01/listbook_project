import 'package:flutter/material.dart';
import '../widget/sidebar.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: Text('Sejarah'.toUpperCase())),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Image.asset('assets/images/sale_4.png')
            ),
            Padding(padding: EdgeInsets.all(16),
              child: Text('Aplikasi Lisbook ini dikembangkan Dengan tujuan penggunanya untuk mencari dari list laptop yang sangat lengkap dalam genggaman tangan dan mudah....'),
            ),
          ],
        ),
      ),
    );
  }
}
