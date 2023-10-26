import 'package:flutter/material.dart';
//import 'package:turismoflutter/src/block/login_block.dart';
import 'package:turismoflutter/src/block/provider.dart';
import 'package:turismoflutter/src/model/usuario_model.dart';
import 'package:turismoflutter/src/providers/usuario_provider.dart';

class RegistroPage extends StatelessWidget {
  RegistroPage({super.key});
  final usuarioProvider = new UsuarioProvider();
  final usuarioModel = new UsuarioModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //color cambiar el fondo

        children: [
          _crearFondo(context),
          _loginForm(context),
        ],
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);

    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 140.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: const EdgeInsets.symmetric(vertical: 45.0),
            padding: const EdgeInsets.symmetric(vertical: 35.0),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 240, 235, 235),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26, // color de la sombra
                  blurRadius: 3.0, // tamaño de la sombra
                  offset: Offset(0.0, 5.0), // posicion de la sombra
                  spreadRadius: 3.0, // tamaño de la sombra
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                const Text(
                  'Crear cuenta',
                  style: TextStyle(fontSize: 20.0),
                ),
                //esto es para dar espacio
                const SizedBox(
                  height: 30.0,
                ),
                _crearNombre(bloc),
                const SizedBox(
                  height: 30.0,
                ),
                _crearEmail(bloc),
                const SizedBox(
                  height: 30.0,
                ),
                _crearPassword(bloc),
                const SizedBox(
                  height: 18.0,
                ),
                _crearBoton(bloc),
              ],
            ),
          ),
          crearCuenta(context),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  Widget _crearNombre(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.nombreStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            // Elimina 'const' antes de TextField
            keyboardType: TextInputType.name,

            decoration: InputDecoration(
              icon:
                  Icon(Icons.person, color: Color.fromARGB(255, 230, 115, 106)),
              hintText: 'nombre',
              labelText: 'Nombre',
              counterText: snapshot.data,
              errorText: snapshot.error as String?,
            ),
            onSaved: (newValue) => usuarioModel.name = newValue!,
            onChanged: bloc.changeNombre,
          ),
        );
      },
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            // Elimina 'const' antes de TextField
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.alternate_email,
                  color: Color.fromARGB(255, 230, 115, 106)),
              hintText: 'ejemplo@correo.com',
              labelText: 'Correo electrónico',
              counterText: snapshot.data,
              errorText: snapshot.error as String?,
            ),
            onSaved: (newValue) => usuarioModel.email = newValue!,
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            obscureText: true, // para que no se vea la contraseña
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Color.fromARGB(255, 214, 84, 84)),
              labelText: 'Contraseña',
              //counterText: snapshot.data,
              errorText: snapshot.error as String?,
            ),
            onSaved: (newValue) =>
                usuarioModel.password = newValue!, // para guardar la contraseña
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _crearBoton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Crear Cuenta'),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            elevation: 0.0,
            primary: Color.fromARGB(255, 153, 14, 9),
            textStyle: const TextStyle(color: Colors.white),
          ),
          //onPressed: snapshot.hasData ? () {} : null,
          onPressed: () {
            _login(bloc, context);
          },
        );
      },
    );
  }

  _login(LoginBloc bloc, BuildContext context) {
    if (bloc.email.isNotEmpty &&
        bloc.password.isNotEmpty &&
        bloc.nombre.isNotEmpty) {
      usuarioModel.name = bloc.nombre;
      usuarioModel.email = bloc.email;
      usuarioModel.password = bloc.password;
      usuarioProvider.crearUsuario(usuarioModel);
      Navigator.pushReplacementNamed(context, 'login');
    } else {
      mostrarAlerta(
          context, 'Faltan datos', 'Por favor ingrese todos los datos');
    }
  }

  void mostrarAlerta(BuildContext context, String titulo, String mensaje) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(mensaje),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      },
    );
  }

  Widget crearCuenta(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushReplacementNamed(
          context,
          'login',
        );
      },
      child: Text(
        'Ya tiene una cuenta',
        style: TextStyle(
          color: Colors.blue, // Color del texto
          decoration: TextDecoration.underline, // Subrayado opcional
        ),
      ),
    );
  }

  //fondo de la pagina
  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoModado = Container(
      height: size.height * .4,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(224, 96, 92, 1),
            Color.fromRGBO(150, 63, 51, 1),
          ],
        ),
      ),
    );
    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
    return Stack(
      children: <Widget>[
        fondoModado,
        Positioned(top: 90.0, left: 30.0, child: circulo),
        Positioned(top: -40.0, right: -30.0, child: circulo),
        Positioned(top: 200.0, right: 20.0, child: circulo),
        Container(
            padding: const EdgeInsets.only(top: 55),
            child: const Column(
              children: <Widget>[
                Icon(
                  Icons.person_pin_circle,
                  color: Colors.white,
                  size: 100.0,
                ),
                SizedBox(
                  height: 10.0,
                  width: double.infinity,
                ),
                Text(
                  'Turismo App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
