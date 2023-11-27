import 'package:flutter/material.dart';
import 'login_screen.dart';
class RegisterScreen extends StatelessWidget {
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
              width: 400,
              height: 250,
            ),
            SizedBox(height: 60),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Введите ваш Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 30),
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
                ],
              ),
            ),
            SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()), // Ок
                );
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
                      Text('Уже есть акаунт?'),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                    },
                    child: Text(
                      'Войти',
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
