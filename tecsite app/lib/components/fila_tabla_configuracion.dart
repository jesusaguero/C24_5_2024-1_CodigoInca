import 'package:flutter/material.dart';

class FilaTablaConfiguracion extends StatelessWidget {
  final String label;
  final String value;
  final double leftLabelWidth; // Ancho fijo para el texto de la izquierda

  const FilaTablaConfiguracion({
    Key? key,
    required this.label,
    required this.value,
    this.leftLabelWidth = 61.0, // Ancho predeterminado para el texto de la izquierda
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Margen horizontal de 20px y margen vertical de 10px
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Texto de la izquierda en negrita con un ancho fijo
          SizedBox(
            width: leftLabelWidth,
            child: Text(
              '$label:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 12), // Espacio entre los textos
          // Texto de la derecha con truncamiento y puntos suspensivos
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16, // Tamaño de la fuente para los textos de la derecha
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1, // Limitar a una línea
              softWrap: false,
            ),
          ),
        ],
      ),
    );
  }
}
