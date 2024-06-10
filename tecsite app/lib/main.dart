import 'package:flutter/material.dart';
import 'package:tecsite/screens/splash_screen.dart';
import 'package:tecsite/screens/home/home_screen.dart';
import 'package:tecsite/screens/asistencia/asistencia_screen.dart';
import 'package:tecsite/screens/detalleasistencia/detalleasistencia_screen.dart';
import 'package:tecsite/screens/carnet/carnet_screen.dart';
import 'package:tecsite/screens/calendario/calendario_screen.dart';
import 'package:tecsite/screens/configuracion/configuracion_screen.dart';
import 'package:tecsite/screens/login/login_screen.dart'; // Importa la pantalla de login

void main() {
  runApp(Tecsite());
}

class Tecsite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tecsite',
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Ruta inicial
      routes: {
        '/': (context) => SplashScreen(), // Pantalla de presentación
        '/login': (context) => LoginScreen(), // Pantalla de login
        '/home': (context) => HomeScreen(), // Pantalla principal
        '/carnet': (context) => CarnetScreen(),
        '/calendario': (context) => CalendarioScreen(),
        '/asistencia': (context) => AsistenciaScreen(),
        '/configuracion': (context) => ConfiguracionScreen(),
        '/detalleasistencia': (context) => DetalleasistenciaScreen(), // Ajusta según la ruta real
    
      },
    );
  }
}
