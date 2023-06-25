import 'package:flutter/material.dart';
import '../model/catalogue.dart';
import 'catalogue_detail.dart';

class CatalogueItem extends StatelessWidget {
  final Catalogue catalogue;

  const CatalogueItem({super.key, required this.catalogue});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(
            "${catalogue.namaCatalogue}",
            style: TextStyle(
              fontFamily: 'Montserrat',
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CatalogueDetail(catalogue: catalogue)));
      },
    );
  }
}
