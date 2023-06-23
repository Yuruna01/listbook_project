import 'package:flutter/material.dart';
import '../widget/sidebar.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: Text('Tentang'.toUpperCase())),
      body: ListView(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text('Listbook Versi 1.0'.toUpperCase())
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text('Listbook ini dibuat untuk memenuhi Projek tugas akhir semester 4 matakuliah Mobile Programing yang dikembangkan oleh kelompok 2 beranggota 5 orang yaitu :'),
          ),
          ListTile(
            leading: Icon(Icons.circle_sharp),
            title: Text('Alvin Austin'),
          ),
          ListTile(
            leading: Icon(Icons.circle_sharp),
            title: Text('Hany Mustika'),
          ),
          ListTile(
            leading: Icon(Icons.circle_sharp),
            title: Text('Marsha Aditya Puandi'),
          ),
          ListTile(
            leading: Icon(Icons.circle_sharp),
            title: Text('Nabil Muthi Maulani'),
          ),
          ListTile(
            leading: Icon(Icons.circle_sharp),
            title: Text('Yusup Supriatna'),
          ),
        ],
      ),
    );
  }
}
