import 'package:flutter/material.dart';
import '../ui/dashboard.dart';
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
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("adminKuya"),
              accountEmail: Text("adminKuya@penyu.com")),
          ListTile(
            leading: Icon(Icons.home_work_rounded),
            title: Text("Dashboard"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Dashboard()));
            },
          ),
          ListTile(
            leading: Icon(Icons.screen_search_desktop_rounded),
            title: Text("Catalogue Brand"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Catalogue()));
            },
          ),
          ListTile(
            leading: Icon(Icons.manage_history),
            title: Text("History"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => History()));
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("About"),
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
