import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:turismoflutter/src/model/categoria_model.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';

class CategoriaProvider {
  //final String _url = 'https://turismo-3ab42-default-rtdb.firebaseio.com';
  final String _url = 'http://192.168.100.34:8000/api';
  final headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<bool> crearCategoria(CategoriaModel categoria) async {
    //final url = '$_url/iglesia.json';
    //final url = Uri.parse('$_url/iglesia');
    final url = '$_url/categoria';
    //final resp = await http.post(url as Uri, body: iglesiaModelToJson(iglesia));
    final resp = await http.post(
      Uri.parse(url),
      headers: headers,
      //body: iglesiaModelToJson(iglesia),
      body: categoriaModelToJson(categoria),
    );
    //final resp = await http.post(url, body: iglesiaModelToJson(iglesia)
    print(resp.body);
    final decodedData = json.decode(resp.body);

    //print(decodedData);

    return true;
  }

  Future<bool> editarCategoria(CategoriaModel categoria) async {
    //final url = '$_url/iglesia.json';
    //final url = Uri.parse('$_url/iglesia');
    final url = '$_url/categoria/${categoria.id}';
    //final resp = await http.post(url as Uri, body: iglesiaModelToJson(iglesia));
    final resp = await http.put(
      Uri.parse(url),
      headers: headers,
      //body: iglesiaModelToJson(iglesia),
      body: categoriaModelToJson(categoria),
    );
    print(resp.body);
    //final resp = await http.post(url, body: iglesiaModelToJson(iglesia)
    final decodedData = json.decode(resp.body);
    //print(decodedData);

    return true;
  }

  Future<List<CategoriaModel>> obtenerCategoria() async {
    final url = Uri.parse('$_url/categoria');
    final resp = await http.get(url, headers: headers);

    final decodedData = json.decode(
      resp.body,
    );
    //final Map<String, dynamic> decodedData = json.decode(resp.body,);
    //print(decodedData);

    if (decodedData == null) return [];
    final List<CategoriaModel> categoria = [];
    //decodedData.forEach((id, igl) {
    decodedData.forEach((igl) {
      final categoriaTemp = CategoriaModel.fromJson(igl);
      //iglTemp.id = id;
      categoria.add(categoriaTemp);
    });
    print(categoria);
    return categoria;
  }

  Future<int> borrarCategoria(String id) async {
    final url = Uri.parse('$_url/categoria/$id');
    final resp = await http.delete(url, headers: headers);

    //print(json.decode(resp.body));

    return 1;
  }
}
