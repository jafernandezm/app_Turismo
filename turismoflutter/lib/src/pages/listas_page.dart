import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:turismoflutter/src/model/lista_model.dart';
import 'package:turismoflutter/src/providers/listas_providers.dart';

import 'package:turismoflutter/src/utils/utils.dart' as utils;
import 'package:image_picker/image_picker.dart';

class ListasPage extends StatefulWidget {
  const ListasPage({super.key});

  @override
  State<ListasPage> createState() => _ListasPageState();
}

class _ListasPageState extends State<ListasPage> {
  final formKey = GlobalKey<FormState>();
  ListasModel listas = new ListasModel();
  final listasProvider = new ListarProvider();
  XFile? foto;
  bool _guardando = false;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    if (args is int) {
      listas.categoria_id = args;
    } else if (args is ListasModel) {
      if (listas != null) {
        listas = args;
      }
    }
    // final IglesiaModel? prodData = ModalRoute.of(context)!.settings.arguments
    //     as IglesiaModel?; //recibe el argumento de la pagina anterior
    // if (prodData != null) {
    //   iglesia = prodData;
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Listas'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.photo_size_select_actual),
            onPressed: _seleccionarFoto,
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: _tomarFoto,
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(children: [
            _mostrarFoto(),
            _crearNombre(),
            _crearDescripcion(),
            _crearDireccion(),
            //_crearTelefono(),
            //_crearEmail(),
            _crearBoton(),
          ]),
        ),
      )),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: listas.nombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        labelText: 'Nombre',
      ),
      onSaved: (value) => listas.nombre = value!,
      validator: (value) {
        if (value!.length < 3) {
          return 'Ingrese el nombre de la Listas';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearDescripcion() {
    return TextFormField(
      initialValue: listas.descripcion,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        labelText: 'Descripcion',
      ),
      onSaved: (value) => listas.descripcion = value!,
      validator: (value) {
        if (value!.length < 3) {
          return 'Ingrese la descripcion de la Listas';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearDireccion() {
    return TextFormField(
      initialValue: listas.direccion,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        labelText: 'Direccion',
      ),
      onSaved: (value) => listas.direccion = value!,
      validator: (value) {
        if (value!.length < 3) {
          return 'Ingrese la direccion de la Listas';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearTelefono() {
    return TextFormField(
      //initialValue: iglesia.telefono.toString(),
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Telefono',
      ),
      //onSaved: (value) => iglesia.telefono = int.parse(value!),
      validator: (value) {
        if (utils.isNumeric(value!)) {
          return null;
        } else {
          return 'Solo numeros';
        }
      },
    );
  }

  Widget _crearEmail() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        labelText: 'Email',
      ),
      //onSaved: (value) => iglesia.email = value!,
      validator: (value) {
        if (value!.length < 3) {
          return 'Ingrese el email de la Listas';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearBoton() {
    return ElevatedButton.icon(
      label: const Text('Guardar'),
      icon: const Icon(FontAwesomeIcons.save),
      style: ElevatedButton.styleFrom(
        primary: Colors.deepPurple,
        onPrimary: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
      ),
      onPressed: (_guardando)
          ? null
          : () {
              _submit();
            },
    );
  }

  void _submit() async {
    if (!formKey.currentState!.validate()) return;

    formKey.currentState!.save();
    setState(() {
      _guardando = true;
    });

    if (foto != null) {
      listas.img = await listasProvider.subirImagen(foto!);
    }

    if (listas.id == 0) {
      listasProvider.crearListas(listas);
    } else {
      listasProvider.editarListas(listas);
    }

    setState(() {
      _guardando = false;
    });
    mostrarSnackbar('Registro guardado');
    //Navigator.pop(context);
    Navigator.pushNamed(context, 'MostrarList', arguments: listas.categoria_id);
  }

  mostrarSnackbar(String mensaje) {
    final snackBar = SnackBar(
      content: Text(mensaje),
      duration: const Duration(milliseconds: 1500),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _mostrarFoto() {
    if (listas.img != "") {
      return FadeInImage(
        image: NetworkImage("http://192.168.100.34:8000/" + listas.img),
        placeholder: const AssetImage('assets/jar-loading.gif'),
        height: 300.0,
        fit: BoxFit.cover,
      );
    } else if (foto != null) {
      return Image.file(
        File(foto!.path),
        height: 300.0,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        'assets/no-image.png',
        height: 300.0,
        fit: BoxFit.cover,
      );
    }
  }

  _seleccionarFoto() async {
    ImagePicker picker = ImagePicker(); // Crear una instancia de ImagePicker
    foto = await picker.pickImage(
        source: ImageSource.gallery); // Llamar al método en la instancia
    if (foto != null) {
      // Actualizar el estado de la aplicación
      listas.img = "";
    }
    setState(() {});
    //Resto de tu código para procesar la imagen
  }

  _tomarFoto() async {
    //procesa la imagen
    ImagePicker picker = ImagePicker(); // Crear una instancia de ImagePicker
    foto = await picker.pickImage(
        source: ImageSource.camera); // Llamar al método en la instancia
    if (foto != null) {
      // Actualizar el estado de la aplicación
    }
    setState(() {});
  }
}
