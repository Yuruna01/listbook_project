import 'package:flutter/material.dart';
import '../widget/sidebar.dart';
import 'addCatalogue.dart';

class Catalogue extends StatelessWidget {
  const Catalogue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Katalog".toUpperCase()),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddCatalogue()));
            },
          )
        ],
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: const Text("Asus"),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text("HP"),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text("Dell"),
            ),
          ),
        ],
      ),
    );
  }
}
