import 'package:flutter/material.dart';
import '../model/catalogue.dart';
import '../service/catalogue_service.dart';
import 'catalogue_detail.dart';

class UpdateCatalogue extends StatefulWidget {
  final Catalogue catalogue;

  const UpdateCatalogue({Key? key, required this.catalogue}) : super(key: key);
  _UpdateCatalogueState createState() => _UpdateCatalogueState();
}

class _UpdateCatalogueState extends State<UpdateCatalogue> {
  final _formKey = GlobalKey<FormState>();
  final _namaCatalogueCtrl = TextEditingController();
  final _lcdCtrl = TextEditingController();
  final _cpuCtrl = TextEditingController();
  final _ramCtrl = TextEditingController();
  final _hddSsdCtrl = TextEditingController();
  final _wifiCtrl = TextEditingController();
  final _usbCtrl = TextEditingController();
  final _fiturCtrl = TextEditingController();
  final _osCtrl = TextEditingController();
  final _hargaCtrl = TextEditingController();
  final _logoCtrl = TextEditingController();

  Future<Catalogue> getData() async {
    Catalogue data =
        await CatalogueService().getById(widget.catalogue.id.toString());
    setState(() {
      _namaCatalogueCtrl.text = data.namaCatalogue;
      _lcdCtrl.text = data.lcd;
      _cpuCtrl.text = data.cpu;
      _ramCtrl.text = data.ram;
      _hddSsdCtrl.text = data.hddSsd;
      _wifiCtrl.text = data.wifi;
      _usbCtrl.text = data.usb;
      _fiturCtrl.text = data.fitur;
      _osCtrl.text = data.os;
      _hargaCtrl.text = data.harga;
      _logoCtrl.text = data.logo;
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const Text(
              "Ubah Catalogue",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
            floating: true,
            snap: true,
          ),
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _fieldNamaCatalogue(),
                    _fieldLcd(),
                    _fieldCpu(),
                    _fieldRam(),
                    _fieldHddSsd(),
                    _fieldWifi(),
                    _fieldUsb(),
                    _fieldFitur(),
                    _fieldOs(),
                    _fieldHarga(),
                    _fieldLogo(),
                    _tombolSimpan()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _fieldNamaCatalogue() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Nama Catalogue",
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
        ),
        controller: _namaCatalogueCtrl,
        style: TextStyle(
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }

  _fieldLcd() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Tipe & Resolusi LCD",
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
        ),
        controller: _lcdCtrl,
        style: TextStyle(
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }

  _fieldCpu() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Jenis CPU",
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
        ),
        controller: _cpuCtrl,
        style: TextStyle(
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }

  _fieldRam() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Ukuran RAM",
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
        ),
        controller: _ramCtrl,
        style: TextStyle(
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }

  _fieldHddSsd() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Tipe & Size HDD/SSD",
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
        ),
        controller: _hddSsdCtrl,
        style: TextStyle(
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }

  _fieldWifi() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Jenis Wi-fi",
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
        ),
        controller: _wifiCtrl,
        style: TextStyle(
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }

  _fieldUsb() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: "USB Port",
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
        ),
        controller: _usbCtrl,
        style: TextStyle(
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }

  _fieldFitur() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Fitur Terbaik",
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
        ),
        controller: _fiturCtrl,
        style: TextStyle(
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }

  _fieldOs() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Sistem Operasi",
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
        ),
        controller: _osCtrl,
        style: TextStyle(
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }

  _fieldHarga() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Harga Device",
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
        ),
        controller: _hargaCtrl,
        style: TextStyle(
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }

  _fieldLogo() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Logo Brand",
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
        ),
        controller: _logoCtrl,
        style: TextStyle(
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }

  _tombolSimpan() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () async {
          Catalogue catalogue = Catalogue(
            namaCatalogue: _namaCatalogueCtrl.text,
            lcd: _lcdCtrl.text,
            cpu: _cpuCtrl.text,
            ram: _ramCtrl.text,
            hddSsd: _hddSsdCtrl.text,
            wifi: _wifiCtrl.text,
            usb: _usbCtrl.text,
            fitur: _fiturCtrl.text,
            os: _osCtrl.text,
            harga: _hargaCtrl.text,
            logo: _logoCtrl.text,
          );

          String id = widget.catalogue.id.toString();
          await CatalogueService().ubah(catalogue, id).then((value) {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CatalogueDetail(catalogue: value),
              ),
            );
          });
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          textStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18,
          ),
        ),
        child: const Text(
          "Simpan",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
    );
  }
}
