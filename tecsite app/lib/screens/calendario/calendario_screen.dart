import 'package:flutter/material.dart';
import 'package:tecsite/components/navbar.dart'; // Ajusta la ruta según tu estructura de carpetas
import 'package:tecsite/components/headlogo.dart';
import 'package:tecsite/screens/calendario/components/horario_widget.dart'; // Asegúrate de importar el archivo correctamente

class CalendarioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeadLogo(), // Utiliza el componente HeadLogo
          Expanded(
            child: HorarioScreen(), // Aquí se llama el widget del horario
          ),
        ],
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: 1, // Índice de la vista actual (Calendario)
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
