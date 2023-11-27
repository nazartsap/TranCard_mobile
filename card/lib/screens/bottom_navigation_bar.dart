import 'package:flutter/material.dart';
import 'profile_screen.dart';

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
    Screen4(),
    ProfileScreen(),
  ];

  final List<IconData> _customIcons = [
    Icons.directions_bus,
    Icons.analytics_outlined,
    Icons.account_balance_wallet,
    Icons.account_circle_rounded,
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

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60.0), // Устанавливаем отступ сверху
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Привет',
                        style: TextStyle(
                          color: Color.fromARGB(255, 71, 146, 75),
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Добавьте здесь обработчик нажатия
                    },
                    child: Image.asset(
                      'assets/profile.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Добавьте здесь обработчик нажатия
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 68, 65, 255),
                onPrimary: Colors.white,
                padding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                minimumSize: Size(150, 50),
                fixedSize: Size(325, 186),
              ),
              child: Text(
                'Выпустить карту +',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Добавьте здесь обработчик нажатия
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 68, 65, 255),
                onPrimary: Colors.white,
                padding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                minimumSize: Size(150, 50),
                fixedSize: Size(297, 43),
              ),
              child: Text(
                'Сканировать QR-код',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(right: 200.0),
              child: Text(
                'Недавние поездки',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
