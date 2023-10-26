import 'dart:convert';

UsuarioModel usuarioModelFromJson(String str) =>
    UsuarioModel.fromJson(json.decode(str));

String usuarioModelToJson(UsuarioModel data) => json.encode(data.toJson());

class UsuarioModel {
  int id;
  String name;
  String email;
  int rol;
  String password;

  UsuarioModel({
    this.id = 0,
    this.name = "",
    this.email = "",
    this.rol = 0,
    this.password = "",
  });

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        rol: json["rol"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "rol": rol,
        "password": password,
      };
}
