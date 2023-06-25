class Catalogue {
  String? id;
  String namaCatalogue;
  String lcd;
  String cpu;
  String ram;
  String hddSsd;
  String wifi;
  String usb;
  String fitur;
  String os;
  String harga;
  String logo;

  Catalogue({
    this.id,
    required this.namaCatalogue,
    required this.lcd,
    required this.cpu,
    required this.ram,
    required this.hddSsd,
    required this.wifi,
    required this.usb,
    required this.fitur,
    required this.os,
    required this.harga,
    required this.logo,
  });

  factory Catalogue.fromJson(Map<String, dynamic> json) => Catalogue(
      id: json["id"],
      namaCatalogue: json["catalogue_name"],
      lcd: json["lcd"],
      cpu: json["cpu"],
      ram: json["ram"],
      hddSsd: json["hdd_ssd"],
      wifi: json["wifi"],
      usb: json["usb"],
      fitur: json["feature"],
      os: json["os"],
      harga: json["price"],
      logo: json["logo"]);

  Map<String, dynamic> toJson() => {
        "catalogue_name": namaCatalogue,
        "lcd": lcd,
        "cpu": cpu,
        "ram": ram,
        "hdd_ssd": hddSsd,
        "wifi": wifi,
        "usb": usb,
        "feature": fitur,
        "os": os,
        "price": harga,
        "logo": logo
      };
}
