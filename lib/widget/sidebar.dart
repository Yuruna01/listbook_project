import 'package:flutter/material.dart';
import '../ui/beranda.dart';
import '../ui/catalogue.dart';
import '../ui/history.dart';
import '../ui/about.dart';
import '../ui/login.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              accountName: Text("adminKuya"),
              accountEmail: Text("adminKuya@penyu.com")),
          ListTile(
            leading: Icon(Icons.home_work_rounded),
            title: Text("Beranda"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Beranda()));
            },
          ),
          ListTile(
            leading: Icon(Icons.screen_search_desktop_rounded),
            title: Text("Katalog Merek"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Catalogue()));
            },
          ),
          ListTile(
            leading: Icon(Icons.manage_history),
            title: Text("Sejarah"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => History()));
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("Tentang"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => About()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout_rounded),
            title: Text("Keluar"),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (Route<dynamic> route) => false);
            },
          )
        ],
      ),
    );
  }
}
