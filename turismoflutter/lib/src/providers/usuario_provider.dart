import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:turismoflutter/src/model/categoria_model.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';
import 'package:turismoflutter/src/model/usuario_model.dart';
import 'package:turismoflutter/src/global/usuario_global.dart';

class UsuarioProvider {
  //final String _url = 'https://turismo-3ab42-default-rtdb.firebaseio.com';
  final String _url = 'http://192.168.100.34:8000/api';
  final headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<bool> login(UsuarioModel usuario) async {
    final url = '$_url/user/login';
    //final resp = await http.post(url as Uri, body: iglesiaModelToJson(iglesia));
    final resp = await http.post(
      Uri.parse(url),
      headers: headers,
      //body: iglesiaModelToJson(iglesia),
      body: usuarioModelToJson(usuario),
    );
    //final resp = await http.post(url, body: iglesiaModelToJson(iglesia)
    print(resp.body);
    final decodedData = json.decode(resp.body);
    if ('exito' == decodedData['message']) {
      final usuarioModel = new UsuarioModel();
      // usuarioModel.name = decodedData['user']['name'];

      // usuarioModel.rol = int.parse(decodedData['user']['role']);
      //UsuarioGlobal().usuario = UsuarioModel.fromJson(decodedData['user']);
      UsuarioGlobal().nombre = decodedData['user']['name'];
      UsuarioGlobal().rol = int.parse(decodedData['user']['rol']);
      // print(UsuarioGlobal().nombre);
      // print(UsuarioGlobal().rol);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> crearUsuario(UsuarioModel usuario) async {
    final url = '$_url/user';
    //final resp = await http.post(url as Uri, body: iglesiaModelToJson(iglesia));
    final resp = await http.post(
      Uri.parse(url),
      headers: headers,
      //body: iglesiaModelToJson(iglesia),
      body: usuarioModelToJson(usuario),
    );
    //final resp = await http.post(url, body: iglesiaModelToJson(iglesia)
    print(resp.body);
    final decodedData = json.decode(resp.body);

    //print(decodedData);

    return true;
  }

  Future<bool> editarUsuario(UsuarioModel usuario) async {
    final url = '$_url/user/${usuario.id}';
    //final resp = await http.post(url as Uri, body: iglesiaModelToJson(iglesia));
    final resp = await http.put(
      Uri.parse(url),
      headers: headers,
      //body: iglesiaModelToJson(iglesia),
      body: usuarioModelToJson(usuario),
    );
    print(resp.body);
    //final resp = await http.post(url, body: iglesiaModelToJson(iglesia)
    final decodedData = json.decode(resp.body);
    //print(decodedData);

    return true;
  }

  Future<List<CategoriaModel>> obtenerUsuario() async {
    final url = Uri.parse('$_url/user');
    final resp = await http.get(url, headers: headers);

    final decodedData = json.decode(
      resp.body,
    );
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

  Future<int> borrarUsuario(String id) async {
    final url = Uri.parse('$_url/user/$id');
    final resp = await http.delete(url, headers: headers);
    //print(json.decode(resp.body));
    return 1;
  }
}
