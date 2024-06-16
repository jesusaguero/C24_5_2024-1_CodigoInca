import 'package:flutter/material.dart';
import 'package:tecsite/components/navbar.dart'; 
import 'package:tecsite/components/headlogo.dart';
import 'package:tecsite/screens/calendario/components/horario_widget.dart'; 

class CalendarioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeadLogo(), 
          Expanded(
            child: HorarioScreen(),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: 1, 
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
