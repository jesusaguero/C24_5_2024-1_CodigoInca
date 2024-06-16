import 'package:flutter/material.dart';

class HeadLogo extends StatelessWidget {
  final bool showMenuIcon;

  HeadLogo({this.showMenuIcon = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      color: Colors.grey[200],
      height: 50,
      child: Stack(
        children: [
          if (showMenuIcon)
            Positioned(
              left: 16, 
              top: 0,
              bottom: 0,
              child: Center(
                child: Icon(
                  Icons.menu,
                  color: Color(0xFF20B2E3),
                  size: 26, 
                ),
              ),
            ),
          Center(
            child: Image.asset(
              'assets/t_logo2.png', 
              width: 40, 
            ),
          ),
        ],
      ),
    );
  }
}
