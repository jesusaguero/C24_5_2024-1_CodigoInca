import 'package:flutter/material.dart';

class CarnetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(0xFFF3FBFF),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 40.0, right: 40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Carnet Digital',
              style: TextStyle(
                color: Color(0xFF00B2E2),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/fotocarnet2.png'),
            ),
            SizedBox(height: 16),
            Text(
              'Agüero Anchivilca\nJesus Roberto',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF004C83),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '10903248323',
              style: TextStyle(
                color: Color(0xFF65798F),
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Image.asset('assets/qrimg.png', height: 80),
            SizedBox(height: 8),
            Text(
              'Pregrado',
              style: TextStyle(
                color: Color(0xFF65798F),
                fontSize: 16,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Diseño y Desarrollo de Software',
              style: TextStyle(
                color: Color(0xFF65798F),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
