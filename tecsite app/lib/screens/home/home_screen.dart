import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tecsite/components/navbar.dart'; // Ajusta la ruta según tu estructura de carpetas
import 'package:tecsite/components/headlogo.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(),
          Column(
            children: [
              HeadLogo(), // Tu componente personalizado si es necesario
              Expanded(
                child: GestureDetector(
                  onVerticalDragEnd: (details) {
                    if (details.primaryVelocity! > 0) {
                      _launchURL('https://www.facebook.com');
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 60), // Espacio para la animación
                                Text(
                                  'tecsup.edu.pe',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 90, // Ajusta según tu necesidad
                          left: MediaQuery.of(context).size.width / 2 - 25, // Centra horizontalmente
                          child: Draggable(
                            axis: Axis.vertical,
                            feedback: Image.asset('assets/googleicon.png', width: 50),
                            childWhenDragging: Container(),
                            onDragEnd: (details) {
                              if (details.offset.dy > MediaQuery.of(context).size.height - 100) {
                                _launchURL('https://www.tecsup.edu.pe/');
                              }
                            },
                            child: Image.asset('assets/googleicon.png', width: 50),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: 2, // Índice de la vista actual (Home)
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

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/homeimg.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken), // Oscurece la imagen
        ),
      ),
    );
  }
}
