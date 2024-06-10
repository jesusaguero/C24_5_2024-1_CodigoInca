import 'package:flutter/material.dart';

class HeadLogo extends StatelessWidget {
  final bool showMenuIcon;

  HeadLogo({this.showMenuIcon = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      color: Colors.grey[200], // Color ligeramente gris
      height: 80, // Puedes ajustar este valor según tus necesidades
      child: Stack(
        children: [
          if (showMenuIcon)
            Positioned(
              left: 16, // Ajusta la distancia desde el borde izquierdo
              top: 0,
              bottom: 0,
              child: Center(
                child: Icon(
                  Icons.menu,
                  color: Color(0xFF20B2E3),
                  size: 32, // Tamaño del icono
                ),
              ),
            ),
          Center(
            child: Image.asset(
              'assets/t_logo2.png', // Ruta de la imagen
              width: 60, // Ancho de la imagen (puedes ajustar este valor según tus necesidades)
            ),
          ),
        ],
      ),
    );
  }
}
