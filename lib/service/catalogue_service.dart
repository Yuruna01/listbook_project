import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/catalogue.dart';

class CatalogueService {
  Future<List<Catalogue>> listData() async {
    final Response response = await ApiClient().get('catalogue');
    final List data = response.data as List;
    List<Catalogue> result =
        data.map((json) => Catalogue.fromJson(json)).toList();
    return result;
  }

  Future<Catalogue> simpan(Catalogue catalogue) async {
    var data = catalogue.toJson();
    final Response response = await ApiClient().post('catalogue', data);
    Catalogue result = Catalogue.fromJson(response.data);
    return result;
  }

  Future<Catalogue> ubah(Catalogue catalogue, String id) async {
    var data = catalogue.toJson();
    final Response response = await ApiClient().put('catalogue/${id}', data);
    print(response);
    Catalogue result = Catalogue.fromJson(response.data);
    return result;
  }

  Future<Catalogue> getById(String id) async {
    final Response response = await ApiClient().get('catalogue/${id}');
    Catalogue result = Catalogue.fromJson(response.data);
    return result;
  }

  Future<Catalogue> hapus(Catalogue catalogue) async {
    final Response response =
        await ApiClient().delete('catalogue/${catalogue.id}');
    Catalogue result = Catalogue.fromJson(response.data);
    return result;
  }
}
