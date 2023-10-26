import 'dart:convert';

ListasModel listasModelFromJson(String str) =>
    ListasModel.fromJson(json.decode(str));

String listasModelToJson(ListasModel data) => json.encode(data.toJson());

class ListasModel {
  int id;
  String nombre;
  String descripcion;
  String direccion;
  String img;
  int categoria_id;
  //String imgURL;
  //int telefono;
  ListasModel({
    this.id = 0,
    this.nombre = "",
    this.descripcion = "",
    this.direccion = "",
    //this.telefono = 0,
    this.img = "",
    this.categoria_id = 0,
    //this.imgURL = ""
  });

  factory ListasModel.fromJson(Map<String, dynamic> json) => ListasModel(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        direccion: json["direccion"],
        img: json["img"],
        categoria_id: json["categoria_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "direccion": direccion,
        "img": img,
        "categoria_id": categoria_id,
      };
}
