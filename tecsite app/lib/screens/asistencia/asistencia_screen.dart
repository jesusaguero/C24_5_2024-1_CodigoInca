import 'package:flutter/material.dart';
import 'package:tecsite/components/navbar.dart'; 
import 'package:tecsite/components/head2.dart';
import 'package:tecsite/screens/asistencia/datatable.dart';
import 'package:tecsite/screens/asistencia/filtrado.dart';

class AsistenciaScreen extends StatelessWidget {

  final List<Map<String, String>> data = [
    {'aula': '701', 'curso': 'Soluciones en la nube'},
    {'aula': '4B-05', 'curso': 'Marketing'},
    {'aula': '4B-06', 'curso': 'Web Avanzado'},
    {'aula': '1508', 'curso': 'Innovación'},
    {'aula': '1507', 'curso': 'Sistemas Empresariales'},
    {'aula': '1506', 'curso': 'Móviles Avanzado'},
    {'aula': '1505', 'curso': 'Aws Console'},
    {'aula': '1504', 'curso': 'Cisco Networking'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Head2(), 
          Expanded(
            child: Column(
              children: [
                SearchBarWithFilter(), 
                AsistenciaTable(data: data),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: 3, // Índice de la vista actual (Home)
        onItemTapped: (index) {
          // Navegar a la vista correspondiente según el índice
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/carnet');
              break;
            case 1:
              Navigator.pushNamed(context, '/calendario');
              break;
            case 2:
              Navigator.pushNamed(context, '/home');
              break;
            case 3:
              Navigator.pushNamed(context, '/asistencia');
              break;
            case 4:
              Navigator.pushNamed(context, '/configuracion');
              break;
          }
        },
      ),
    );
  }
}
