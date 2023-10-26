import 'package:turismoflutter/src/model/usuario_model.dart';

class UsuarioGlobal {
  static UsuarioGlobal? _instance;

  UsuarioModel? usuario;
  //nombre y rol
  String nombre = '';
  int rol = 0;
  factory UsuarioGlobal() {
    return _instance ??= UsuarioGlobal._();
  }

  UsuarioGlobal._();
}
