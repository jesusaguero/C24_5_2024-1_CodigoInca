import 'package:flutter/material.dart';

class AsistenciaTable extends StatelessWidget {
  final List<Map<String, String>> data;

  AsistenciaTable({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
      child: ListView(
        shrinkWrap: true,
        children: [
          DataTable(
            columnSpacing: 20,
            columns: [
              DataColumn(
                label: Text(
                  'Aula',
                  style: TextStyle(
                    color: Color(0xFF004C83),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Curso',
                  style: TextStyle(
                    color: Color(0xFF004C83),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Acciones',
                  style: TextStyle(
                    color: Color(0xFF004C83),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            rows: data.map((course) {
              return DataRow(
                cells: [
                  DataCell(Text(course['aula']!, style: TextStyle(color: Colors.black))),
                  DataCell(Text(course['curso']!, style: TextStyle(color: Colors.black))),
                  DataCell(
                    Container(
                      height: 24,
                      width: 60,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/detalleasistencia');
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: Color(0xFF004C83),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Ver',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
