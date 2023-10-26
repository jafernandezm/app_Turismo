import 'dart:async';

import 'package:turismoflutter/src/block/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _nombreController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //recuperar los datos del stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);
  Stream<String> get nombreStream =>
      _nombreController.stream.transform(validarNombre);
  //combinar los streams
  Stream<bool> get formValidStream =>
      Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);
  //combinar los streams de nombre email y password
  Stream<bool> get formValidStream2 => Rx.combineLatest3(
      emailStream, passwordStream, nombreStream, (e, p, n) => true);

  //insertar valores al stream
  Function(String) get changeEmail => _emailController.sink.add;
  //insertar valores de nombres
  Function(String) get changeNombre => _nombreController.sink.add;
  //obtener el ultimo valor ingresado a los streams
  Function(String) get changePassword => _passwordController.sink.add;

  //obtener el ultimo valor ingresado a los streams
  // String get email => _emailController.value;
  // String get password => _passwordController.value;

  String get email => _emailController.valueOrNull ?? '';
  String get nombre => _nombreController.valueOrNull ?? '';
  String get password => _passwordController.valueOrNull ?? '';
  //cerrar los streams
  set email(String value) {
    _emailController.add(value); // Setter para asignar un valor al email
  }

  set nombre(String value) {
    _nombreController.add(value); // Setter para asignar un valor al nombre
  }

  set password(String value) {
    _passwordController.add(value); // Setter para asignar un valor al password
  }

  dispose() {
    _emailController?.close();
    _passwordController?.close();
    _nombreController?.close();
  }
}
