import 'package:flutter/material.dart';
import 'package:turismoflutter/src/block/provider.dart';
import 'package:turismoflutter/src/model/lista_model.dart';
import 'package:turismoflutter/src/providers/listas_providers.dart';
import 'package:turismoflutter/src/global/usuario_global.dart';

class MostrarListPage extends StatelessWidget {
  MostrarListPage({super.key});

  final listasProvider = new ListarProvider();

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;

    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listas'),
      ),
      body: _crearListado(id),
      floatingActionButton: _crearBoton(context, id),
    );
  }

  Widget _crearListado(id) {
    return FutureBuilder(
      future: listasProvider.obtenerListas(id),
      builder:
          (BuildContext context, AsyncSnapshot<List<ListasModel>> snapshot) {
        if (snapshot.hasData) {
          final lista = snapshot.data;
          return ListView.builder(
            itemCount: lista!.length,
            itemBuilder: (context, i) => _crearItem1(context, lista[i]),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, ListasModel listas) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direccion) {
        listasProvider.borrarIglesia(listas.id.toString());
      },
      child: Card(
        child: Column(
          children: <Widget>[
            (listas.img == null)
                ? Image(image: AssetImage('assets/no-image.png'))
                : FadeInImage(
                    image: NetworkImage(
                        "http://192.168.100.34:8000/" + listas.img),
                    placeholder: AssetImage('assets/jar-loading.gif'),
                    height: 150.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
            ListTile(
              title: Text('${listas.nombre}-'),
              subtitle: Text(listas.id.toString()),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () async {
                final result = await Navigator.popAndPushNamed(
                  context,
                  'basic_design',
                  arguments: listas,
                );
                if (result != null && result is ListasModel) {
                  listasProvider.editarListas(result);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearItem1(BuildContext context, ListasModel listas) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direccion) {
        listasProvider.borrarIglesia(listas.id.toString());
      },
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            'basic_design',
            arguments: listas,
          );
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 6,
            child: Row(
              children: <Widget>[
                SizedBox(width: 1),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: (listas.img == null)
                      ? Image(image: AssetImage('assets/no-image.png'))
                      : FadeInImage(
                          image: NetworkImage(
                              "http://192.168.100.34:8000/" + listas.img),
                          placeholder: AssetImage('assets/jar-loading.gif'),
                          height: 130.0,
                          width: 150.0,
                          fit: BoxFit.cover,
                        ),
                ),
                SizedBox(width: 10), // Espacio entre la imagen y el título
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${listas.nombre}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // SizedBox(height: 1), // Espacio entre el título y el ID
                    ],
                  ),
                ),
                SizedBox(width: 1), // Espacio entre el ID y el icono
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _crearItem1(BuildContext context, ListasModel listas) {
  //   return Dismissible(
  //     key: UniqueKey(),
  //     background: Container(
  //       color: Colors.red,
  //     ),
  //     onDismissed: (direccion) {
  //       listasProvider.borrarIglesia(listas.id.toString());
  //     },
  //     child: Container(
  //       width: double.infinity,
  //       padding: EdgeInsets.all(10),
  //       child: Card(

  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(20),
  //         ),
  //         elevation: 6,
  //         child: Row(

  //           children: <Widget>[
  //             SizedBox(width: 1),
  //             ClipRRect(
  //               borderRadius: BorderRadius.circular(10),
  //               child: (listas.img == null)
  //                   ? Image(image: AssetImage('assets/no-image.png'))
  //                   : FadeInImage(
  //                       image: NetworkImage(
  //                           "http://192.168.100.34:8000/" + listas.img),
  //                       placeholder: AssetImage('assets/jar-loading.gif'),
  //                       height: 130.0,
  //                       width: 150.0,
  //                       fit: BoxFit.cover,
  //                     ),
  //             ),
  //             SizedBox(width: 10), // Espacio entre la imagen y el título
  //             Expanded(
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     '${listas.nombre}',
  //                     style:
  //                         TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
  //                     maxLines: 3,
  //                     overflow: TextOverflow.ellipsis,
  //                   ),
  //                   // SizedBox(height: 1), // Espacio entre el título y el ID
  //                 ],
  //               ),
  //             ),
  //             SizedBox(width: 1), // Espacio entre el ID y el icono
  //             const Icon(Icons.arrow_forward_ios),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _crearBoton(BuildContext context, id) {
    if (UsuarioGlobal().rol == 1)
      return FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
        onPressed: () => Navigator.pushNamed(context, 'Listas', arguments: id),
      );
    else
      return Container(); // Si no se cumple la condición, se muestra un contenedor vacío
  }
}
