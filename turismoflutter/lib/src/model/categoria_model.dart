import 'dart:convert';

CategoriaModel categoriaModelFromJson(String str) =>
    CategoriaModel.fromJson(json.decode(str));

String categoriaModelToJson(CategoriaModel data) => json.encode(data.toJson());

class CategoriaModel {
  int id;
  String nombre;
  String icono;
  String descripcion;
  String color1;
  String color2;
  //String imgURL;
  //int telefono;
  CategoriaModel({
    this.id = 0,
    this.nombre = "",
    this.icono = "FontAwesomeIcons.carCrash",
    this.descripcion = "",
    this.color1 = "0xff6989F5",
    this.color2 = "0xff6989F5",
  });

  factory CategoriaModel.fromJson(Map<String, dynamic> json) => CategoriaModel(
        id: json["id"],
        nombre: json["nombre"],
        icono: json["icono"],
        descripcion: json["descripcion"],
        color1: json["color1"],
        color2: json["color2"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "icono": icono,
        "color1": color1,
        "color2": color2,
      };
}
