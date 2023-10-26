import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:turismoflutter/src/model/lista_model.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';

class ListarProvider {
  //final String _url = 'https://turismo-3ab42-default-rtdb.firebaseio.com';
  final String _url = 'http://192.168.100.34:8000/api';
  final headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };
  Future<bool> crearListas(ListasModel iglesia) async {
    //final url = '$_url/iglesia.json';
    //final url = Uri.parse('$_url/iglesia');
    final url = '$_url/listas';
    //final resp = await http.post(url as Uri, body: iglesiaModelToJson(iglesia));
    final resp = await http.post(
      Uri.parse(url),
      headers: headers,
      body: listasModelToJson(iglesia),
    );
    //final resp = await http.post(url, body: iglesiaModelToJson(iglesia)
    print(resp.body);

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<bool> editarListas(ListasModel iglesia) async {
    //final url = '$_url/iglesia.json';
    //final url = Uri.parse('$_url/iglesia');
    final url = '$_url/listas/${iglesia.id}';
    //final resp = await http.post(url as Uri, body: iglesiaModelToJson(iglesia));
    final resp = await http.put(
      Uri.parse(url),
      headers: headers,
      body: listasModelToJson(iglesia),
    );
    print(resp.body);
    //final resp = await http.post(url, body: iglesiaModelToJson(iglesia)
    final decodedData = json.decode(resp.body);
    //print(decodedData);

    return true;
  }

  Future<List<ListasModel>> obtenerListas(int id) async {
    final url = Uri.parse('$_url/listar/$id');
    final resp = await http.get(url, headers: headers);

    final decodedData = json.decode(
      resp.body,
    );
    //final Map<String, dynamic> decodedData = json.decode(resp.body,);
    //print(decodedData);

    if (decodedData == null) return [];
    final List<ListasModel> iglesia = [];
    //decodedData.forEach((id, igl) {
    decodedData.forEach((igl) {
      final iglTemp = ListasModel.fromJson(igl);
      //iglTemp.id = id;
      iglesia.add(iglTemp);
    });
    //print(iglesia);
    return iglesia;
  }

  Future<int> borrarIglesia(String id) async {
    final url = Uri.parse('$_url/listas/$id');
    final resp = await http.delete(url, headers: headers);

    //print(json.decode(resp.body));

    return 1;
  }

  Future<String> subirImagen(XFile imagen) async {
    final url = Uri.parse(
        '${_url}/listas/subirImagen'); // Reemplaza con la URL correcta de tu API
    final mimeType = mime(imagen.path)!.split('/'); // image/jpeg
    final imageUploadRequest = http.MultipartRequest('POST', url);

    final file = await http.MultipartFile.fromPath(
      'imagen', // Nombre del campo en el formulario
      imagen.path,
      contentType: MediaType(
          mimeType[0], mimeType[1]), // Cambia 'jpeg' según el tipo de imagen
    );

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final response = await http.Response.fromStream(streamResponse);

    if (response.statusCode != 200 && response.statusCode != 201) {
      //print('Algo salió mal');
      //print(response.body);
      return null!;
    }
    final respData = json.decode(response.body);
    //print(respData);
    return respData['ruta'];
  }
}
