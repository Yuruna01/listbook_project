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
  Stream<List<Catalogue>> getList() async* {
    List<Catalogue> data = await CatalogueService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              "ListBook Catalogue",
              style: TextStyle(
                fontFamily: 'Indie Flower',
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
            child: StreamBuilder(
              stream: getList(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    snapshot.error.toString(),
                    style: TextStyle(
                      fontFamily: 'Indie Flower',
                    ),
                  );
                }
                if (snapshot.connectionState != ConnectionState.done) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    'Data Kosong',
                    style: TextStyle(
                      fontFamily: 'Indie Flower',
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation:
                          0, // Set elevation to 0 to remove the default shadow
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
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
                            CatalogueItem(catalogue: snapshot.data[index]),
                            Positioned(
                              top: 8,
                              right: 10,
                              child: CircleAvatar(
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/images/avatar.png',
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
