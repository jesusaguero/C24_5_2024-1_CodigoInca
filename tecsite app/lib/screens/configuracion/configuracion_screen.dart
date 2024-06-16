import 'package:flutter/material.dart';
import 'package:tecsite/components/navbar.dart';
import 'package:tecsite/components/headlogo.dart';
import 'package:tecsite/components/fila_tabla_configuracion.dart'; 

class ConfiguracionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeadLogo(showMenuIcon: true), 
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50, 
                    backgroundImage: AssetImage('assets/fotocarnet.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Carnet Estudiantil',
                    style: TextStyle(
                      fontSize: 17, 
                      color: Color(0xFF20B2E3), 
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 20), 
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Información Personal',
                        style: TextStyle(
                          fontSize: 16, 
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.only(top: 10), 
                    child: FilaTablaConfiguracion(
                      label: 'Nombre',
                      value: 'Dave Ryan Santivañez Munguia',
                    ),
                  ),
                  
                  FilaTablaConfiguracion(
                    label: 'Correo',
                    value: 'dave.santivanez@gmail.com',
                  ),

                  FilaTablaConfiguracion(
                    label: 'Teléfono',
                    value: '+51 903 010 882',
                  ),

                  FilaTablaConfiguracion(
                    label: 'Código',
                    value: '115458',
                  ),

                  FilaTablaConfiguracion(
                    label: 'Carrera',
                    value: 'Diseño y Desarrollo de Software',
                  ),

                  FilaTablaConfiguracion(
                    label: 'Ciclo',
                    value: 'V Ciclo',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: 4, 
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
