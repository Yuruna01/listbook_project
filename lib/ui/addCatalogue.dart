import 'package:flutter/material.dart';

class AddCatalogue extends StatefulWidget {
  const AddCatalogue({Key? key}) : super(key: key);
  _AddCatalogueState createState() => _AddCatalogueState();
}

class _AddCatalogueState extends State<AddCatalogue> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Catalogue Brand")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextField(
                  decoration: const InputDecoration(labelText: "Nama Brand")),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {}, child: const Text("Simpan"))
            ],
          ),
        ),
      ),
    );
  }
}
