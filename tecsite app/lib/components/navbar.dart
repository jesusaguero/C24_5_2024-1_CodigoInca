import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  NavBar({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        _buildNavItem(Icons.card_membership, 'Carnet', 0),
        _buildNavItem(Icons.calendar_today, 'Calendario', 1),
        _buildNavItem(Icons.home, 'Inicio', 2),
        _buildNavItem(Icons.assignment, 'Asistencia', 3),
        _buildNavItem(Icons.settings, 'Ajustes', 4),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Color(0xFF20B2E3),
      onTap: onItemTapped,
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: index == selectedIndex ? Color(0xFF20B2E3) : Colors.grey),
          Text(
            label,
            style: TextStyle(
              color: index == selectedIndex ? Color(0xFF20B2E3) : Colors.grey,
            ),
          ),
          if (index == selectedIndex)
            Container(
              margin: EdgeInsets.only(top: 4),
              height: 3,
              width: 24,
              color: Color(0xFF20B2E3),
            ),
        ],
      ),
      label: '', // Leave the label empty to avoid double text
    );
  }
}
