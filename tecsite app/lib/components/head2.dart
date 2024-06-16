import 'package:flutter/material.dart';

class Head2 extends StatelessWidget {
  final bool showMenuIcon;
  final bool showBackIcon; 
  final VoidCallback? onBackPressed; 

  Head2({this.showMenuIcon = false, this.showBackIcon = false, this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0), 
      color: Color(0xFF0B74BB),
      height: 48,
      width: double.infinity, 
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
                  color: Colors.white,
                  size: 32, 
                ),
              ),
            ),
          if (showBackIcon) 
            Positioned(
              left: 16,
              top: 0,
              bottom: 0,
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: onBackPressed ?? () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          Center(
            child: Text(
              'Cursos 5to. C24-A',
              style: TextStyle(
                color: Colors.white, 
                fontSize: 18,
                fontWeight: FontWeight.bold, 
              ),
            ),
          ),
        ],
      ),
    );
  }
}
