import 'package:flutter/material.dart';
import 'settings_screen.dart';
import 'home_screen.dart';
import 'card_screen.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    CardScreen(),
    SettingsScreen(),
  ];

  final List<IconData> _customIcons = [
    Icons.home_outlined,
    Icons.credit_card_outlined,
    Icons.person_outline_rounded,
  ];

  final List<IconData> _activeCustomIcons = [
    Icons.home_rounded,
    Icons.credit_card_rounded,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        unselectedItemColor: Color(0xffa29f9d), // Цвет неактивных иконок
        selectedItemColor: Color(0xff35363a), // Цвет активной иконки
        items: [
          BottomNavigationBarItem(
            icon: Icon(_customIcons[0]),
            activeIcon: Icon(_activeCustomIcons[0]),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(_customIcons[1]),
            activeIcon: Icon(_activeCustomIcons[1]),
            label: 'Карта',
          ),
          BottomNavigationBarItem(
            icon: Icon(_customIcons[2]),
            activeIcon: Icon(_activeCustomIcons[2]),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Экран 4'),
    );
  }
}
