import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tecsite/screens/login/login_screen.dart';  // Importa la pantalla que se mostrará después del splash

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 310,
          height: 310,
          child: Image.asset('assets/splash_image_tecsup.png'),
        ),
      ),
    );
  }
}