import 'package:flutter/material.dart';
import '../model/catalogue.dart';
import '../service/catalogue_service.dart';
import 'catalogue_detail.dart';
import 'addCatalogue.dart';
import 'catalogue_item.dart';
import '../widget/sidebar.dart';

class CataloguePage extends StatefulWidget {
  const CataloguePage({Key? key}) : super(key: key);
  _CataloguePageState createState() => _CataloguePageState();
}

class _CataloguePageState extends State<CataloguePage> {
  String searchText = '';

  Future<List<Catalogue>> getList() async {
    List<Catalogue> data = await CatalogueService().listData();
    return data;
  }

  List<Catalogue> _filteredList(List<Catalogue> data) {
    if (searchText.isEmpty) {
      return data;
    }

    return data.where((catalogue) {
      return catalogue.namaCatalogue
          .toLowerCase()
          .contains(searchText.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const Text(
              "ListBook Catalogue",
              style: TextStyle(
                fontFamily: 'Indie Flower',
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              _addCatalogue(),
              SizedBox(width: 7),
            ],
            floating: true,
            snap: true,
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchText = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Cari Nama Device',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 1),
                    ),
                    style: TextStyle(
                      fontFamily: 'Indie Flower',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: FutureBuilder<List<Catalogue>>(
                    future: getList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text(
                          snapshot.error.toString(),
                          style: TextStyle(
                            fontFamily: 'Indie Flower',
                          ),
                        );
                      }
                      if (!snapshot.hasData ||
                          snapshot.connectionState != ConnectionState.done) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      final filteredList = _filteredList(snapshot.data!);

                      if (filteredList.isEmpty) {
                        return Text(
                          'Data Kosong',
                          style: TextStyle(
                            fontFamily: 'Indie Flower',
                          ),
                        );
                      }

                      return ListView.builder(
                        itemCount: filteredList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 0,
                            margin: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.cyan.shade100,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(0, 2),
                                    blurRadius: 5,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  CatalogueItem(catalogue: filteredList[index]),
                                  Positioned(
                                    top: 8,
                                    right: 10,
                                    child: CircleAvatar(
                                      child: ClipOval(
                                        child: Image.asset(
                                          'assets/images/${filteredList[index].logo}.jpeg',
                                          width: 90,
                                          height: 90,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _addCatalogue() {
    return IconButton(
      icon: Icon(Icons.add),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddCatalogue(),
          ),
        );
      },
    );
  }
}
