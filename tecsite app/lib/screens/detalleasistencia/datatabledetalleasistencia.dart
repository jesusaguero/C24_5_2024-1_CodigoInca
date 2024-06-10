import 'package:flutter/material.dart';

class AttendanceTable extends StatelessWidget {
  final List<Map<String, String>> data;

  AttendanceTable({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20), // Márgenes izquierdo y derecho de 20
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 40, // Ancho de la pantalla menos 40 (20 de cada lado)
          child: DataTable(
            columnSpacing: 20, // Espacio entre las columnas
            columns: [
              DataColumn(
                label: Center(
                  child: Text(
                    'Semana',
                    style: TextStyle(
                      color: Color(0xFF004C83),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: Center(
                  child: Text(
                    'Fecha',
                    style: TextStyle(
                      color: Color(0xFF004C83),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: Center(
                  child: Text(
                    'Asistencia',
                    style: TextStyle(
                      color: Color(0xFF004C83),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
            rows: data.map((attendance) {
              return DataRow(
                cells: [
                  DataCell(
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(attendance['semana']!, style: TextStyle(color: Colors.black)),
                    ),
                  ),
                  DataCell(
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(attendance['fecha']!, style: TextStyle(color: Colors.black)),
                    ),
                  ),
                  DataCell(
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0), // Añadir padding para mover el cubo a la derecha
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                          decoration: BoxDecoration(
                            color: _getAttendanceColor(attendance['asistencia']!),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey), // Añadir borde gris
                          ),
                          child: Text(
                            attendance['asistencia']!,
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Color _getAttendanceColor(String status) {
    switch (status) {
      case 'P':
        return Color(0xFFD2FFC3); // Verde claro
      case 'F':
        return Color(0xFFFFDBDB); // Rojo claro
      case 'T':
        return Color(0xFFFFF4BD); // Amarillo claro
      default:
        return Colors.grey;
    }
  }
}
