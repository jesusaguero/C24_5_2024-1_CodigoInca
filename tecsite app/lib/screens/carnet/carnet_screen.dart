import 'package:flutter/material.dart';
import 'package:tecsite/components/navbar.dart'; // Ajusta la ruta según tu estructura de carpetas
import 'package:tecsite/components/headlogo.dart';
import 'package:tecsite/screens/carnet/components/carnet_widget.dart'; // Asegúrate de importar el archivo correctamente

class CarnetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeadLogo(), // Utiliza el componente HeadLogo
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '¡Bienvenido!',
                        style: TextStyle(
                          color: Color(0xFF004C83),
                          fontSize: 24, // Ajusta el tamaño de fuente según sea necesario
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Lunes, 02 de Enero del 2024',
                        style: TextStyle(
                          color: Color(0xFF6E6E6E),
                          fontSize: 16, // Ajusta el tamaño de fuente según sea necesario
                        ),
                      ),
                    ),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: CarnetWidget(), // Reemplaza el texto con el widget del carnet
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: 0, // Índice de la vista actual (Home)
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
