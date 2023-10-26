import 'dart:async';

mixin Validators {
  final validarPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 6) {
      sink.add(password);
    } else {
      sink.addError('Mas de 6 caracteres por favor');
    }
  });

  final validarEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern as String);
    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Email no valido');
    }
  });

  final validarNombre = StreamTransformer<String, String>.fromHandlers(
      handleData: (nombre, sink) {
    if (nombre.length >= 3) {
      sink.add(nombre);
    } else {
      sink.addError('Mas de 3 caracteres por favor');
    }
  });

  final validarApellido = StreamTransformer<String, String>.fromHandlers(
      handleData: (apellido, sink) {
    if (apellido.length >= 3) {
      sink.add(apellido);
    } else {
      sink.addError('Mas de 3 caracteres por favor');
    }
  });

  final validarTelefono = StreamTransformer<String, String>.fromHandlers(
      handleData: (telefono, sink) {
    if (telefono.length >= 10) {
      sink.add(telefono);
    } else {
      sink.addError('Mas de 10 caracteres por favor');
    }
  });

  final validarDireccion = StreamTransformer<String, String>.fromHandlers(
      handleData: (direccion, sink) {
    if (direccion.length >= 10) {
      sink.add(direccion);
    } else {
      sink.addError('Mas de 10 caracteres por favor');
    }
  });

  final validarCiudad = StreamTransformer<String, String>.fromHandlers(
      handleData: (ciudad, sink) {
    if (ciudad.length >= 3) {
      sink.add(ciudad);
    } else {
      sink.addError('Mas de 3 caracteres por favor');
    }
  });

  final validarPais =
      StreamTransformer<String, String>.fromHandlers(handleData: (pais, sink) {
    if (pais.length >= 3) {
      sink.add(pais);
    } else {
      sink.addError('Mas de 3 caracteres por favor');
    }
  });

  final validarCodigoPostal = StreamTransformer<String, String>.fromHandlers(
      handleData: (codigoPostal, sink) {
    if (codigoPostal.length >= 3) {
      sink.add(codigoPostal);
    } else {
      sink.addError('Mas de 3 caracteres por favor');
    }
  });

  final validarFechaNacimiento = StreamTransformer<String, String>.fromHandlers(
      handleData: (fechaNacimiento, sink) {
    if (fechaNacimiento.length >= 3) {
      sink.add(fechaNacimiento);
    } else {
      sink.addError('Mas de 3 caracteres por favor');
    }
  });

  final validarFechaRegistro = StreamTransformer<String, String>.fromHandlers(
      handleData: (fechaRegistro, sink) {
    if (fechaRegistro.length >= 3) {
      sink.add(fechaRegistro);
    } else {
      sink.addError('Mas de 3 caracteres por favor');
    }
  });

  final validarFechaActualizacion =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (fechaActualizacion, sink) {
    if (fechaActualizacion.length >= 3) {
      sink.add(fechaActualizacion);
    } else {
      sink.addError('Mas de 3 caracteres por favor');
    }
  });
}
