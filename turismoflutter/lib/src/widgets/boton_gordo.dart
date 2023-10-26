import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {
  const BotonGordo(
      {super.key,
      this.icon = FontAwesomeIcons.circle,
      required this.texto,
      this.color1 = Colors.grey,
      this.color2 = Colors.blueGrey,
      required this.onPress});
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          this.onPress();
        },
        child: Stack(
          children: <Widget>[
            _BotonGordoBackground(
              icon: icon,
              color1: color1,
              color2: color2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 140,
                  width: 40,
                ),
                FaIcon(FontAwesomeIcons.carCrash,
                    color: Colors.white, size: 40),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  // Utilizamos el widget Expanded para el texto
                  child: Text(
                    texto,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 40,
                ),
              ],
            ),
          ],
        ));
  }
}

class _BotonGordoBackground extends StatelessWidget {
  final IconData icon;
  final Color color1;
  final Color color2;
  const _BotonGordoBackground({
    super.key,
    required this.icon,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: <Widget>[
            // Background
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                icon,
                size: 150,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
          ],
        ),
      ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(4, 6),
            blurRadius: 15,
          ),
        ],
        gradient: LinearGradient(
          colors: <Color>[
            color1,
            color2,
          ],
        ),
      ),
    );
  }
}
// class _BotonGordo extends StatelessWidget {
//   const _BotonGordo({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         _BotonGordoBackground(),
//         Row(
//           children: <Widget>[
//             SizedBox(
//               height: 140,
//               width: 40,
//             ),
//             FaIcon(FontAwesomeIcons.carCrash, color: Colors.white, size: 40),
//             SizedBox(
//               width: 20,
//             ),
//             Text('Iglesias de Sucre',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold)),
//             SizedBox(
//               width: 40,
//             ),
//             FaIcon(
//               FontAwesomeIcons.chevronRight,
//               color: Colors.white,
//             )
//           ],
//         ),
//       ],
//     );
//   }
// }