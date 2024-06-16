import 'package:flutter/material.dart';

class FilaTablaConfiguracion extends StatelessWidget {
  final String label;
  final String value;
  final double leftLabelWidth; // Ancho fijo para el texto de la izquierda

  const FilaTablaConfiguracion({
    Key? key,
    required this.label,
    required this.value,
    this.leftLabelWidth = 61.0, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          SizedBox(
            width: leftLabelWidth,
            child: Text(
              '$label:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 12), 
         
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16, 
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1, 
              softWrap: false,
            ),
          ),
        ],
      ),
    );
  }
}
