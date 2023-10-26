import 'package:flutter/material.dart';
//import 'package:turismoflutter/src/block/login_block.dart';
import 'package:turismoflutter/src/block/provider.dart';
import 'package:turismoflutter/src/model/usuario_model.dart';
import 'package:turismoflutter/src/providers/usuario_provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final usuarioModel = new UsuarioModel();
  final usuarioProvider = new UsuarioProvider();
  bool estado = false;
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
              height: 180.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: const EdgeInsets.symmetric(vertical: 25.0),
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
                  'Ingreso',
                  style: TextStyle(fontSize: 20.0),
                ),
                //esto es para dar espacio
                const SizedBox(
                  height: 60.0,
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
          olvidoSuCorreo(),
          SizedBox(
            height: 100.0,
          ),
        ],
      ),
    );
  }

  Widget olvidoSuCorreo() {
    return Container(
      child: Text('¿Olvido la contraseña?'),
    );
  }

  Widget crearCuenta(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushReplacementNamed(
          context,
          'registro',
        );
      },
      child: Text(
        'Crear una cuenta',
        style: TextStyle(
          color: Colors.blue, // Color del texto
          decoration: TextDecoration.underline, // Subrayado opcional
        ),
      ),
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
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
          child: TextField(
            obscureText: true, // para que no se vea la contraseña
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Color.fromARGB(255, 214, 84, 84)),
              labelText: 'Contraseña',
              //counterText: snapshot.data,
              errorText: snapshot.error as String?,
            ),
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
            child: Text('Ingresar'),
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

  _login(LoginBloc bloc, BuildContext context) async {
    if (bloc.email.isNotEmpty && bloc.password.isNotEmpty) {
      print('================');
      print('Email: ${bloc.email}');
      print('Password: ${bloc.password}');
      print('================');

      usuarioModel.email = bloc.email;
      usuarioModel.password = bloc.password;

      estado = await usuarioProvider.login(usuarioModel);

      print(estado);
      if (estado) {
        // Inicio de sesión exitoso, dirigir al usuario a la pantalla "header"
        Navigator.pushReplacementNamed(context, 'header',
            arguments: usuarioModel);
      } else {
        // Los datos de inicio de sesión son incorrectos, mostrar un mensaje de error
        mostrarAlerta(context, 'Error de inicio de sesión',
            'Los datos de inicio de sesión son incorrectos.');
      }
      // Navigator.pushReplacementNamed(context, 'header');
    } else {
      // El campo de correo electrónico o contraseña está vacío, mostrar un mensaje de error
      mostrarAlerta(context, 'Error de inicio de sesión',
          'Debes llenar todos los campos para iniciar sesión.');
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
            //Color.fromRGBO(196, 18, 48, 1),
            //Color.fromRGBO(252, 209, 22, 1),
            //Color.fromRGBO(34, 139, 34, 1),
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
            padding: const EdgeInsets.only(top: 60),
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
