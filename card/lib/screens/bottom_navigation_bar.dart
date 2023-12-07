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
    Screen3(),
    CardScreen(),
    SettingsScreen(),
  ];

  final List<IconData> _customIcons = [
    Icons.directions_bus,
    Icons.analytics_outlined,
    Icons.account_balance_wallet,
    Icons.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.grey, // Цвет неактивных иконок
        selectedItemColor: Colors.black, // Цвет активной иконки
        items: [
          BottomNavigationBarItem(
            icon: Icon(_customIcons[0]),
            label: 'Поездки',
          ),
          BottomNavigationBarItem(
            icon: Icon(_customIcons[1]),
            label: 'Статистика',
          ),
          BottomNavigationBarItem(
            icon: Icon(_customIcons[2]),
            label: 'Пополнить',
          ),
          BottomNavigationBarItem(
            icon: Icon(_customIcons[3]),
            label: 'Настройки',
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

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Экран 3'),
    );
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
