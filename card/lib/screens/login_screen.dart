import 'package:card/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'bottom_navigation_bar.dart';
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Image.asset(
              'assets/g.png',
              width: 600,
              height: 250,
            ),
            SizedBox(height: 60),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Введите номер телефона',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Введите пароль',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}), // Чекбокс "Запомнить меня"
                      Text('Запомнить меня'),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Действие при нажатии на "Забыли пароль?"
                    },
                    child: Text(
                      'Забыли пароль?',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BottomNavigationBarWidget()), // Ок
                );
                // Действие при нажатии на кнопку "Войти"
              },
              style: ElevatedButton.styleFrom(
                primary:  Color.fromARGB(255, 68, 65, 255), // Цвет фона кнопки
                onPrimary: Colors.white, // Цвет текста на кнопке
                padding: EdgeInsets.all(16), // Отступы внутри кнопки
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), // Скругленные углы
                ),
                minimumSize: Size(150, 50), // Минимальный размер кнопки (ширина x высота)
                fixedSize: Size(200, 50), // Фиксированный размер кнопки (ширина x высота)
              ),
              child: Text('Войти'),
            ),
            SizedBox(height: 80),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Нет аккаунта?'),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterScreen()), // Ок
                      );
                      // Действие при нажатии на "Зарегистрироваться"
                    },
                    child: Text(
                      'Зарегистрируйтесь',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}






