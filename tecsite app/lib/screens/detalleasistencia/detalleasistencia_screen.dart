import 'package:flutter/material.dart';
import 'package:tecsite/components/navbar.dart'; 
import 'package:tecsite/components/head2.dart';
import 'package:tecsite/screens/detalleasistencia/cursoporcentaje.dart';
import 'package:tecsite/screens/detalleasistencia/datatabledetalleasistencia.dart';

class DetalleasistenciaScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Head2(showBackIcon: true, 
                onBackPressed: () {
                  Navigator.of(context).pop();
                },
          ), 
          Expanded(
            child: Column(
              children: [
                CourseProgress(progress: 70, courseName: 'Soluciones en la nube'),
                Expanded(
                  child: AttendanceTable(
                    data: [
                      {'semana': 'N° 1', 'fecha': '15/04/2024', 'asistencia': 'F'},
                      {'semana': 'N° 2', 'fecha': '16/03/2024', 'asistencia': 'P'},
                      {'semana': 'N° 3', 'fecha': '09/02/2024', 'asistencia': 'T'},
                      {'semana': 'N° 4', 'fecha': '05/05/2024', 'asistencia': 'T'},
                      {'semana': 'N° 5', 'fecha': '05/05/2024', 'asistencia': 'F'},
                      {'semana': 'N° 6', 'fecha': '05/05/2024', 'asistencia': 'T'},
                      {'semana': 'N° 7', 'fecha': '02/02/2024', 'asistencia': 'P'},
                      {'semana': 'N° 8', 'fecha': '04/03/2024', 'asistencia': 'T'},
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: 3, 
        onItemTapped: (index) {
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
