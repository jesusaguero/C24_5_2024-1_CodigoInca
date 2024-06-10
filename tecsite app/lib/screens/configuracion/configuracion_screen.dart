import 'package:flutter/material.dart';
import 'package:tecsite/components/navbar.dart'; // Ajusta la ruta según tu estructura de carpetas
import 'package:tecsite/components/headlogo.dart';
import 'package:tecsite/components/fila_tabla_configuracion.dart'; // Ajusta la ruta según tu estructura de archivos

class ConfiguracionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeadLogo(showMenuIcon: true), // Utiliza el componente HeadLogo con el icono de menú
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Imagen con marco circular
                  CircleAvatar(
                    radius: 50, // Radio del marco circular
                    backgroundImage: AssetImage('assets/fotocarnet.png'), // Ruta de la imagen
                  ),
                  SizedBox(height: 10), // Espaciado entre la imagen y el texto
                  // Texto "Carnet Estudiantil"
                  Text(
                    'Carnet Estudiantil',
                    style: TextStyle(
                      fontSize: 17, // Tamaño de la fuente
                      color: Color(0xFF20B2E3), // Color del texto
                    ),
                  ),
                  SizedBox(height: 20), // Margen superior de 20px para el siguiente texto
                  // Texto "Información Personal" con margen a la izquierda
                  Padding(
                    padding: EdgeInsets.only(left: 20), // Margen a la izquierda de 20px
                    child: Align(
                      alignment: Alignment.centerLeft, // Alineación a la izquierda
                      child: Text(
                        'Información Personal',
                        style: TextStyle(
                          fontSize: 16, // Tamaño de la fuente
                          color: Colors.black, // Color del texto
                        ),
                      ),
                    ),
                  ),
                  // Componente FilaTablaConfiguracion con "nombre:" a la izquierda y "Dave Ryan Santivañez Munguia" a la derecha
                   Padding(
                    padding: EdgeInsets.only(top: 10), // Margen superior de 10px
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
        selectedIndex: 4, // Índice de la vista actual (Configuración)
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
