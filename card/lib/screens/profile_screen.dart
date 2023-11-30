import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'policy_screen.dart';
import 'help_screen.dart';
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Image.asset(
                'assets/profile_icon.png',
                width: 600,
                height: 150,
              ),
              Text(
                'Андрей',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 50),
              Ink(
                decoration: ShapeDecoration(
                  color: Colors.lightBlue, // Цвет при нажатии
                  shape: CircleBorder(), // Форма кнопки
                ),
                child: InkWell(
                  onTap: () {
                    // Добавьте здесь обработчик нажатия на кнопку
                  },
                  child: Image.asset(
                    'assets/button_security.png',
                    width: 370.0,
                  ),
                ),

              ),
              SizedBox(height: 50),
              Ink(
                decoration: ShapeDecoration(
                  color: Colors.lightBlue, // Цвет при нажатии
                  shape: CircleBorder(), // Форма кнопки
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PolicyScreen()), // Ок
                    );
                  },
                  child: Image.asset(
                    'assets/button_privacy.png',
                    width: 370.0,
                  ),
                ),

              ),
              SizedBox(height: 50),
              Ink(
                decoration: ShapeDecoration(
                  color: Colors.lightBlue, // Цвет при нажатии
                  shape: CircleBorder(), // Форма кнопки
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SupportScreen()), // Ок
                    );
                  },
                  child: Image.asset(
                    'assets/button_help.png',
                    width: 370.0,
                  ),
                ),

              ),
              SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
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
                  'Выйти',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}








