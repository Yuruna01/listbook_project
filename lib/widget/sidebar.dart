import 'package:flutter/material.dart';
import '../ui/dashboard.dart';
import '../ui/catalogue_page.dart';
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
            accountName: Text("adminListBook",
                style: TextStyle(
                  fontFamily: 'Indie Flower',
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                )),
            accountEmail: Text("admin@listBook.com",
                style: TextStyle(
                  fontFamily: 'Indie Flower',
                  color: Colors.black,
                  fontSize: 12,
                )),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/logo.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/cover.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home_work_rounded,
              color: Colors.cyan.shade300,
            ),
            title: Text(
              "Dashboard",
              style: TextStyle(
                fontFamily: 'Indie Flower',
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.screen_search_desktop_rounded,
              color: Colors.cyan.shade300,
            ),
            title: Text(
              "ListBook Catalogue",
              style: TextStyle(
                fontFamily: 'Indie Flower',
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CataloguePage()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.manage_history,
              color: Colors.cyan.shade300,
            ),
            title: Text(
              "History",
              style: TextStyle(
                fontFamily: 'Indie Flower',
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => History()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.cyan.shade300,
            ),
            title: Text(
              "About",
              style: TextStyle(
                fontFamily: 'Indie Flower',
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => About()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.cyan.shade300,
            ),
            title: Text(
              "Sign Out",
              style: TextStyle(
                fontFamily: 'Indie Flower',
                color: Colors.black,
                fontSize: 16,
              ),
            ),
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
