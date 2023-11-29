import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 0.0),
          child: Column(
            children: [
              Image.asset(
                'assets/profile_icon.png',
                width: 600,
                height: 250,
              ),
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
                    // Добавьте здесь обработчик нажатия на кнопку
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
                    // Добавьте здесь обработчик нажатия на кнопку
                  },
                  child: Image.asset(
                    'assets/button_help.png',
                    width: 370.0,
                  ),
                ),

              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  // Обработчик нажатия для четвертой кнопки
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








