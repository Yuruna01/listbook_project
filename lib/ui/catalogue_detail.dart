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
            centerTitle: true,
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
                      fontFamily: 'Montserrat',
                    ),
                  );
                }
                return Row(
                  children: [
                    Text(
                      "${snapshot.data.namaCatalogue}",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 13.6,
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
                      fontFamily: 'Montserrat',
                    ),
                  );
                }

                return ListView(
                  padding: EdgeInsets.only(top: 0),
                  children: [
                    Center(
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/${snapshot.data.logo}.jpeg',
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Card(
                      child: ListTile(
                        title: Text(
                          "Device Name",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data.namaCatalogue,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "LCD",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data.lcd,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "CPU",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data.cpu,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "RAM",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data.ram,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "HDD/SSD",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data.hddSsd,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "Wifi",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data.wifi,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "USB Port",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data.usb,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "Fitur Terbaik",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data.fitur,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "Sistem Operasi",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data.os,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "Harga",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data.harga,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
              fontFamily: 'Montserrat',
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
              fontFamily: 'Montserrat',
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
                      fontFamily: 'Montserrat',
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
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  style:
                      ElevatedButton.styleFrom(primary: Colors.cyan.shade300),
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
                  fontFamily: 'Montserrat',
                ),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.red),
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
