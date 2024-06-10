import 'package:flutter/material.dart';

class Head2 extends StatelessWidget {
  final bool showMenuIcon;
  final bool showBackIcon; // Nuevo parámetro para mostrar la flecha hacia atrás
  final VoidCallback? onBackPressed; // Callback para la acción de retroceso

  Head2({this.showMenuIcon = false, this.showBackIcon = false, this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0), // Color de fondo
      color: Color(0xFF0B74BB),
      height: 48, // Altura ajustada
      width: double.infinity, // Ocupa todo el ancho de la pantalla
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
                  color: Colors.white, // Color del icono
                  size: 32, // Tamaño del icono
                ),
              ),
            ),
          if (showBackIcon) // Condición para mostrar la flecha hacia atrás
            Positioned(
              left: 16,
              top: 0,
              bottom: 0,
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: onBackPressed ?? () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          Center(
            child: Text(
              'Cursos 5to. C24-A',
              style: TextStyle(
                color: Colors.white, // Color del texto
                fontSize: 18, // Tamaño de la fuente
                fontWeight: FontWeight.bold, // Negrita para el texto
              ),
            ),
          ),
        ],
      ),
    );
  }
}
