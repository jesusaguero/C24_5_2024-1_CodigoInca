import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tecsite/screens/home/home_screen.dart'; // Importa la pantalla principal

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Definir un OutlineInputBorder personalizado con color de borde azul
    final OutlineInputBorder customInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10), // Borde redondeado
      borderSide: BorderSide(color: Color(0xFF20B2E3)), // Borde de color azul
    );

    final inputFormatter = LengthLimitingTextInputFormatter(6);

    return Scaffold(
      backgroundColor: Colors.white, // Establecer el color de fondo a blanco
      body: Center(
        child: SingleChildScrollView( // Envolver en SingleChildScrollView para evitar desbordamientos
          child: Container(
            width: 400, // Ancho del contenedor
            padding: EdgeInsets.symmetric(horizontal: 16), // Padding para darle margen
            child: Column(
              mainAxisSize: MainAxisSize.min, // Ajustar al tamaño mínimo
              children: [
                // Imagen
                Image.asset(
                  'assets/t_tecsup.jpg', // Ruta de la imagen
                  width: 120, // Ancho de la imagen
                ),
                SizedBox(height: 28), // Espaciado entre la imagen y los inputs
                // Input 1
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Código Estudiantil',
                    border: customInputBorder, // Usar el OutlineInputBorder personalizado
                    enabledBorder: customInputBorder, // Borde cuando el TextField está habilitado
                    focusedBorder: customInputBorder, // Borde cuando el TextField está enfocado
                    contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16), // Relleno interno del campo
                  ),
                  inputFormatters: [inputFormatter], // Aplicar el formateador de entrada
                  keyboardType: TextInputType.number, // Tipo de teclado numérico
                ),
                SizedBox(height: 20), // Espaciado entre los inputs
                // Input 2
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    border: customInputBorder, // Usar el OutlineInputBorder personalizado
                    enabledBorder: customInputBorder, // Borde cuando el TextField está habilitado
                    focusedBorder: customInputBorder, // Borde cuando el TextField está enfocado
                    contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16), // Relleno interno del campo
                  ),
                  obscureText: true, // Ocultar texto de la contraseña
                ),
                SizedBox(height: 20), // Espaciado entre los inputs y el botón
                // Botón "Iniciar sesión"
                Container(
                  width: double.infinity, // Ancho completo
                  height: 48, // Altura igual a la de los TextField
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Text(
                      'Iniciar sesión',
                      style: TextStyle(fontSize: 20), // Aumentar el tamaño de la fuente a 20
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF20B2E3)), // Color de fondo azul
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Color del texto blanco
                      side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Color(0xFF20B2E3))), // Borde de color azul
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Borde redondeado
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20), // Espaciado entre el botón y el texto
                // Texto "------o continua con--------"
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "o continua con",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey)),
                    ],
                  ),
                ),
                SizedBox(height: 20), // Espaciado entre el texto y el botón de Google
                // Botón de Google
                Container(
                  width: double.infinity, // Ancho completo
                  height: 48, // Altura igual a la de los TextField
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/google_logo.png', // Ruta de la imagen del logo de Google
                          height: 24,
                          width: 24,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Google',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white), // Color de fondo blanco
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // Color del texto negro
                      side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Colors.grey)), // Borde de color gris
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Borde redondeado
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
