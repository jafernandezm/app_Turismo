import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:turismoflutter/src/model/categoria_model.dart';
import 'package:turismoflutter/src/widgets/boton_gordo.dart';
import 'package:turismoflutter/src/widgets/header_page.dart';
import 'package:turismoflutter/src/providers/categoria_providers.dart';
import 'package:animate_do/animate_do.dart';
import 'package:turismoflutter/src/global/usuario_global.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final String ruta;
  ItemBoton(this.icon, this.texto, this.color1, this.color2, this.ruta);
}

class HeaderPage extends StatelessWidget {
  HeaderPage({Key? key});
  final categoria = new CategoriaProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            //color
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 236, 234, 234),
                ],
              ),
            ),
            margin: EdgeInsets.only(top: 200),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                obtenerListado(),
              ],
            ),
          ),
          _Encabezado(),
        ],
      ),
    );
  }

  Widget obtenerListado() {
    return FutureBuilder<List<CategoriaModel>>(
      future: categoria.obtenerCategoria(),
      builder:
          (BuildContext context, AsyncSnapshot<List<CategoriaModel>> snapshot) {
        if (snapshot.hasData) {
          final categorias = snapshot.data!;
          return Column(
            children: <Widget>[
              ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: categorias.length,
                itemBuilder: (context, index) {
                  final categoria = categorias[index];
                  return FadeIn(
                    child: BotonGordo(
                      icon: FontAwesomeIcons.carCrash,
                      texto: categoria.nombre,
                      color1: Color.fromARGB(255, 245, 110, 110),
                      color2: Color.fromARGB(255, 228, 79, 79),
                      onPress: () {
                        Navigator.pushNamed(context, 'MostrarList',
                            arguments: categoria.id);
                      },
                    ),
                  );
                },
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error al cargar las categorías'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class _Encabezado extends StatelessWidget {
  const _Encabezado({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconHeader(
          icon: FontAwesomeIcons.mapLocation,
          titulo: 'Turismo',
          subtitulo: 'Lugares Turisticos',
        ),
        if (UsuarioGlobal().rol == 1)
          Positioned(
            right: 0,
            top: 45,
            child: PopupMenuButton<String>(
              onSelected: (value) {
                // Acción a realizar cuando se selecciona una opción del menú emergente
                if (value == 'Categoria') {
                  Navigator.pushNamed(context, 'Categoria');
                } else if (value == 'Otra Opción') {
                  // Lógica para otra opción
                }
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem<String>(
                  value: 'Categoria',
                  child: Text('Categoría'),
                ),
                PopupMenuItem<String>(
                  value: 'Otra Opción',
                  child: Text('Otra Opción'),
                ),
              ],
              icon: FaIcon(
                FontAwesomeIcons.ellipsisV,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}

// class _Encabezado extends StatelessWidget {
//   const _Encabezado({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         IconHeader(
//             icon: FontAwesomeIcons.mapLocation,
//             titulo: 'Turismo',
//             subtitulo: 'Lugares Turisticos'),
//         if (UsuarioGlobal().rol == 1)
//           Positioned(
//             right: 0,
//             top: 45,
//             child: RawMaterialButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, 'Categoria');
//               },
//               shape: CircleBorder(),
//               padding: EdgeInsets.all(15.0),
//               child: FaIcon(
//                 FontAwesomeIcons.ellipsisV,
//                 color: Colors.white,
//               ),
//             ),
//           )
//       ],
//     );
//   }
// }
