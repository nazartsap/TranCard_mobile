import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Регистрация'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Экран регистрации'),
            // Добавьте поля для ввода информации для регистрации
            // и кнопку для регистрации.
          ],
        ),
      ),
    );
  }
}
