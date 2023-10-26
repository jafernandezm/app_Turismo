import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  const IconHeader({
    Key? key,
    required this.icon,
    required this.titulo,
    required this.subtitulo,
  }) : super(key: key);

  final IconData icon;
  final String titulo;
  final String subtitulo;

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.white;
    final size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        _IconHeaderBackgroup(size: size),
        // Positioned(
        //   top: -50,
        //   left: -70,
        //   child: FaIcon(
        //     FontAwesomeIcons.circleUser,
        //     size: 250,
        //     color: Colors.white,
        //   ),
        // ),
        Column(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.10,
              width: double.infinity,
            ),
            Text(
              titulo,
              style: TextStyle(
                fontSize: 40,
                color: const Color.fromARGB(255, 228, 223, 223),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitulo,
              style: TextStyle(
                fontSize: 25,
                color: const Color.fromARGB(255, 236, 234, 234),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FaIcon(
              //FontAwesomeIcons.mapMarkedAlt,
              icon,
              size: 60,
              color: Color.fromARGB(255, 247, 243, 243),
            ),
          ],
        ),
      ],
    );
  }
}

class _IconHeaderBackgroup extends StatelessWidget {
  const _IconHeaderBackgroup({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.red, // Color rojo en el medio
            Colors.red, // Color rojo en el medio
          ],
          // stops: [
          //   0.0,
          //   0.45,
          //   0.5,
          //   0.55,
          //   1.0,
          // ], // Ajustamos los puntos de parada según las posiciones deseadas
        ),
      ),
    );
  }
}
