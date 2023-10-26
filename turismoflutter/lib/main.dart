import 'package:flutter/material.dart';
import 'package:turismoflutter/src/block/provider.dart';
import 'package:turismoflutter/src/pages/list_item_page.dart';
import 'package:turismoflutter/src/pages/categoria_page.dart';
import 'package:turismoflutter/src/pages/header_page.dart';
import 'package:turismoflutter/src/pages/listas_page.dart';
import 'package:turismoflutter/src/pages/mostrar_page.dart';
import 'package:turismoflutter/src/widgets/darhboard_page.dart';
import 'package:turismoflutter/src/pages/login_page.dart';
import 'package:turismoflutter/src/pages/registro_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          initialRoute: 'login',
          routes: {
            'login': (BuildContext context) => LoginPage(),
            'basic_design': (BuildContext context) => const ListItemPage(),
            'dashboard': (BuildContext context) => const Dashboard(),
            'header': (BuildContext context) => HeaderPage(),
            'Listas': (BuildContext context) => const ListasPage(),
            'MostrarList': (BuildContext context) => MostrarListPage(),
            'Categoria': (BuildContext context) => const CategoriaPage(),
            'registro': (BuildContext context) => RegistroPage(),
          },
          theme: ThemeData(
            primaryColor: Colors.deepPurple,
          )),
    );
  }
}
