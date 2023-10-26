import 'package:flutter/material.dart';
import 'package:turismoflutter/src/model/lista_model.dart';
import 'package:turismoflutter/src/global/usuario_global.dart';

class ListItemPage extends StatefulWidget {
  const ListItemPage({
    super.key,
  });

  @override
  State<ListItemPage> createState() => _ListItemPageState();
}

class _ListItemPageState extends State<ListItemPage> {
  @override
  Widget build(BuildContext context) {
    final listas = ModalRoute.of(context)!.settings.arguments as ListasModel;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              //physics: BouncingScrollPhysics(),
              children: [
                FadeInImage(
                  image:
                      NetworkImage("http://192.168.100.34:8000/" + listas.img),
                  placeholder: AssetImage('assets/jar-loading.gif'),
                  height: 300.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                //Titulo

                Title(titulo: listas.nombre, subtitulo: listas.direccion),
                //Button Section
                ButtonSection(),

                //Descripcion
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 1),
                      Text(
                        'Direccion',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        listas.direccion == null
                            ? 'No hay direccion'
                            : listas.direccion!,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Descripción',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        listas.descripcion == null
                            ? 'No hay descripción'
                            : listas.descripcion!,
                      ),
                    ],
                  ),
                ),
                if (UsuarioGlobal().rol == 1)
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'Listas', arguments: listas);
                    },
                    child: Icon(Icons.edit),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(icon: Icons.call, text: 'Call'),
            CustomButton(icon: Icons.map, text: 'Route'),
            CustomButton(icon: Icons.share, text: 'Share'),
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomButton({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(this.icon, color: Colors.blue, size: 30),
        Text(this.text, style: TextStyle(color: Colors.blue)),
      ],
    );
  }
}

class Title extends StatelessWidget {
  const Title({Key? key, required this.titulo, required this.subtitulo})
      : super(key: key);
  final String titulo;
  final String subtitulo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  maxLines:
                      2, // Establece el número máximo de líneas del título
                  overflow: TextOverflow
                      .ellipsis, // Establece el truncamiento de texto si es necesario
                ),
                Text(
                  subtitulo,
                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red),
          Text('41'),
        ],
      ),
    );
  }
}
