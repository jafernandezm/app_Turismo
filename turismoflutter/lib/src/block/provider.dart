import 'package:flutter/material.dart';
import 'package:turismoflutter/src/block/login_block.dart';
export 'package:turismoflutter/src/block/login_block.dart';

class Provider extends InheritedWidget {
  static Provider? _instancia;
  factory Provider({Key? key, required Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(key: key, child: child);
    }
    return _instancia!;
  }

  final loginBloc = LoginBloc();

  Provider._internal({Key? key, required Widget child})
      : super(key: key, child: child);
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static LoginBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider)
        .loginBloc;
  }

  //LoginBloc loginBloc = LoginBloc();
}
