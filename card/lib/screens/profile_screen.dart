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
              ElevatedButton(
                onPressed: () {
                  // Обработчик нажатия для первой кнопки
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 239, 241, 243),
                  onPrimary: Colors.white,
                  padding: EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: Size(366, 74),
                  fixedSize: Size(366, 74),
                ),
                child: Text(
                  'Безопасность',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 30),
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
                    'assets/button_privacy.png', // Путь к изображению кнопки
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Обработчик нажатия для третьей кнопки
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 239, 241, 243),
                  onPrimary: Colors.white,
                  padding: EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: Size(366, 74),
                  fixedSize: Size(366, 74),
                ),
                child: Text(
                  'Поддержка',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                ),
              ),
              SizedBox(height: 30),
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








