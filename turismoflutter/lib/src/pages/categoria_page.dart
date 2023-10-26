import 'package:flutter/material.dart';
import 'package:turismoflutter/src/model/categoria_model.dart';
import 'package:turismoflutter/src/providers/categoria_providers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CategoriaPage extends StatefulWidget {
  const CategoriaPage({super.key});
  @override
  State<CategoriaPage> createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> {
  final formKey = GlobalKey<FormState>();
  CategoriaModel categoria = new CategoriaModel();
  final categoriaProvider = new CategoriaProvider();
  bool _guardando = false;
  Color _colorSeleccionado = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categoria'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _crearNombre(),
                Divider(),
                _crearDescripcion(),
                //_crearboton(),
                Divider(),
                _crearBoton(),
                Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //Primer ejemplo de input
  Widget _crearNombre() {
    return TextFormField(
      //autofocus: true,
      initialValue: categoria.nombre,
      textCapitalization:
          TextCapitalization.sentences, //Primera letra en mayuscula
      decoration: InputDecoration(
        //Decoracion del input
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)), //Borde del input
        hintText:
            'Nombre de la persona', //Texto que aparece cuando no hay nada escrito
        labelText: 'Nombre', //Texto que aparece arriba del input

        suffixIcon: Icon(Icons.accessibility), //Icono a la derecha
        icon: Icon(Icons.account_circle), //Icono a la izquierda
      ), //
      //onChanged: (valor) => setState(() {}), //Cuando cambia el valor del input
      onSaved: (value) => categoria.nombre = value!,
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
      //autofocus: true,
      initialValue: categoria.descripcion,
      textCapitalization:
          TextCapitalization.sentences, //Primera letra en mayuscula
      decoration: InputDecoration(
        //Decoracion del input
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)), //Borde del input
        hintText:
            'Descripcion de la persona', //Texto que aparece cuando no hay nada escrito
        labelText: 'Descripcion', //Texto que aparece arriba del input

        suffixIcon: Icon(Icons.accessibility), //Icono a la derecha
        icon: Icon(Icons.account_circle), //Icono a la izquierda
      ), //
      //onChanged: (valor) => setState(() {}), //Cuando cambia el valor del input
      onSaved: (value) => categoria.descripcion = value!,
      validator: (value) {
        if (value!.length < 3) {
          return 'Ingrese el nombre de la Listas';
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

    if (categoria.id == 0) {
      categoriaProvider.crearCategoria(categoria);
    } else {
      categoriaProvider.editarCategoria(categoria);
    }

    setState(() {
      _guardando = false;
    });
    //mostrarSnackbar('Registro guardado');
    //Navigator.pop(context);
    Navigator.pushNamed(context, 'header');
  }
}

//   Widget _crearboton() {
//     return DropdownButtonFormField<OptionItem>(
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         labelText: 'Categoría',
//         prefixIcon: Icon(Icons.category),
//       ),
//       items: opciones.map((opcion) {
//         return DropdownMenuItem<OptionItem>(
//           value: opcion,
//           child: Row(
//             children: <Widget>[
//               Icon(opcion.icon),
//               SizedBox(width: 10.0),
//               Text(opcion.nombre),
//             ],
//           ),
//         );
//       }).toList(),
//       onChanged: (opcionSeleccionada) {
//         setState(() {
//           _opcionSeleccionada = opcionSeleccionada;
//         });
//       },
//       value: _opcionSeleccionada,
//     );
//   }

//   void _submit() async {
//     //if (!formKey.currentState!.validate()) return;

//     //formKey.currentState!.save();
//     setState(() {
//       _guardando = true;
//     });

//     if (categoria.id == 0) {
//       categoriaProvider.crearCategoria(categoria);
//     } else {
//       categoriaProvider.editarCategoria(categoria);
//     }

//     setState(() {
//       _guardando = false;
//     });
//     //mostrarSnackbar('Registro guardado');
//     //Navigator.pop(context);
//     Navigator.pop(context);
//   }

//   void _mostrarSelectorColor(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Seleccionar color'),
//           content: SingleChildScrollView(
//             child: ColorPicker(
//               pickerColor: _colorSeleccionado,
//               onColorChanged: (color) {
//                 setState(() {
//                   _colorSeleccionado = color;
//                 });
//               },
//               showLabel: true,
//               pickerAreaHeightPercent: 0.8,
//             ),
//           ),
//           actions: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cerrar'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
