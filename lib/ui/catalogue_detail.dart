import 'package:flutter/material.dart';
import '../service/catalogue_service.dart';
import 'catalogue_page.dart';
import 'updateCatalogue.dart';
import '../model/catalogue.dart';
import 'addCatalogue.dart';

class CatalogueDetail extends StatefulWidget {
  final Catalogue catalogue;

  const CatalogueDetail({Key? key, required this.catalogue}) : super(key: key);
  _CatalogueDetailState createState() => _CatalogueDetailState();
}

class _CatalogueDetailState extends State<CatalogueDetail> {
  Stream<Catalogue> getData() async* {
    Catalogue data =
        await CatalogueService().getById(widget.catalogue.id.toString());
    yield data;
  }

  Stream<List<Catalogue>> getList() async* {
    List<Catalogue> data = await CatalogueService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            title: StreamBuilder(
              stream: getData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (snapshot.connectionState != ConnectionState.done) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    'Data Tidak Ditemukan',
                    style: TextStyle(
                      fontFamily: 'Indie Flower',
                    ),
                  );
                }
                return Row(
                  children: [
                    Text(
                      "${snapshot.data.namaCatalogue}",
                      style: TextStyle(
                        fontFamily: 'Indie Flower',
                      ),
                    ),
                  ],
                );
              },
            ),
            actions: [
              _tombolUbah(),
              SizedBox(width: 3),
              _tombolHapus(),
              SizedBox(width: 7),
            ],
            floating: true,
            snap: true,
          ),
          SliverFillRemaining(
            child: StreamBuilder(
              stream: getData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (snapshot.connectionState != ConnectionState.done) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    'Data Tidak Ditemukan',
                    style: TextStyle(
                      fontFamily: 'Indie Flower',
                    ),
                  );
                }

                return ListView(
                  children: [
                    Card(
                      child: ListTile(
                        title: Text(
                          "Device Name",
                          style: TextStyle(
                            fontFamily: 'Indie Flower',
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data.namaCatalogue,
                          style: TextStyle(
                            fontFamily: 'Indie Flower',
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "LCD",
                          style: TextStyle(
                            fontFamily: 'Indie Flower',
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data.lcd,
                          style: TextStyle(
                            fontFamily: 'Indie Flower',
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "CPU",
                          style: TextStyle(
                            fontFamily: 'Indie Flower',
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data.cpu,
                          style: TextStyle(
                            fontFamily: 'Indie Flower',
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "RAM",
                          style: TextStyle(
                            fontFamily: 'Indie Flower',
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data.ram,
                          style: TextStyle(
                            fontFamily: 'Indie Flower',
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "HDD/SSD",
                          style: TextStyle(
                            fontFamily: 'Indie Flower',
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data.hddSsd,
                          style: TextStyle(
                            fontFamily: 'Indie Flower',
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "Wifi",
                          style: TextStyle(
                            fontFamily: 'Indie Flower',
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data.wifi,
                          style: TextStyle(
                            fontFamily: 'Indie Flower',
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "USB Port",
                          style: TextStyle(
                            fontFamily: 'Indie Flower',
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data.usb,
                          style: TextStyle(
                            fontFamily: 'Indie Flower',
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "Fitur Terbaik",
                          style: TextStyle(
                            fontFamily: 'Indie Flower',
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data.fitur,
                          style: TextStyle(
                            fontFamily: 'Indie Flower',
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "Sistem Operasi",
                          style: TextStyle(
                            fontFamily: 'Indie Flower',
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data.os,
                          style: TextStyle(
                            fontFamily: 'Indie Flower',
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "Harga",
                          style: TextStyle(
                            fontFamily: 'Indie Flower',
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data.harga,
                          style: TextStyle(
                            fontFamily: 'Indie Flower',
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _tombolUbah() {
    return StreamBuilder(
      stream: getData(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return Text(
            'Data Tidak Ditemukan',
            style: TextStyle(
              fontFamily: 'Indie Flower',
            ),
          );
        }
        return IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UpdateCatalogue(
                  catalogue: snapshot.data,
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _tombolHapus() {
    return IconButton(
      icon: Icon(Icons.delete),
      onPressed: () {
        AlertDialog alertDialog = AlertDialog(
          content: const Text(
            "Yakin ingin menghapus data ini?",
            style: TextStyle(
              fontFamily: 'Indie Flower',
            ),
          ),
          actions: [
            StreamBuilder(
              stream: getData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (snapshot.connectionState != ConnectionState.done) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    'Data Tidak Ditemukan',
                    style: TextStyle(
                      fontFamily: 'Indie Flower',
                    ),
                  );
                }
                return ElevatedButton(
                  onPressed: () async {
                    await CatalogueService().hapus(snapshot.data).then((value) {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CataloguePage(),
                        ),
                      );
                    });
                  },
                  child: const Text(
                    "YA",
                    style: TextStyle(
                      fontFamily: 'Indie Flower',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Tidak",
                style: TextStyle(
                  fontFamily: 'Indie Flower',
                ),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.green),
            ),
          ],
        );
        showDialog(
          context: context,
          builder: (context) => alertDialog,
        );
      },
      style: ElevatedButton.styleFrom(primary: Colors.transparent),
    );
  }
}
