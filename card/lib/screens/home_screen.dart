import 'package:flutter/material.dart';

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
                  Column( // Используем Column для текста "Привет" и "Name"
                    children: [
                      Text(
                        'Привет',
                        style: TextStyle(
                          color: Color.fromARGB(255, 71, 146, 75),  // Изменяем цвет текста "Привет"
                          fontSize: 18, // Устанавливаем размер шрифта
                        ),
                      ),
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 24, // Устанавливаем больший размер шрифта для "Name"
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
            SizedBox(height: 20), // Отступ между "Name" и кнопкой войти
            ElevatedButton(
              onPressed: () {
                // Добавьте здесь обработчик нажатия
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 68, 65, 255), // Цвет фона кнопки
                onPrimary: Colors.white, // Цвет текста на кнопке
                padding: EdgeInsets.all(16), // Отступы внутри кнопки
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16), // Скругленные углы
                ),
                minimumSize: Size(150, 50), // Минимальный размер кнопки (ширина x высота)
                fixedSize: Size(325, 186), // Фиксированный размер кнопки (ширина x высота)
              ),
              child: Text(
                'Выпустить карту +',
                style: TextStyle(
                  fontSize: 24, // Устанавливаем размер шрифта
                ),
              ),
            ),
            SizedBox(height: 30), // Отступ между кнопкой "Выпустить карту +" и "Сканировать QR-код"
            ElevatedButton(
              onPressed: () {
                // Добавьте здесь обработчик нажатия
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 68, 65, 255), // Цвет фона кнопки
                onPrimary: Colors.white, // Цвет текста на кнопке
                padding: EdgeInsets.all(16), // Отступы внутри кнопки
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16), // Скругленные углы
                ),
                minimumSize: Size(150, 50), // Минимальный размер кнопки (ширина x высота)
                fixedSize: Size(297, 43), // Фиксированный размер кнопки (ширина x высота)
              ),
              child: Text(
                'Сканировать QR-код',
                style: TextStyle(
                  fontSize: 12, // Устанавливаем размер шрифта
                ),
              ),
            ),
            SizedBox(height: 30), // Отступ между кнопкой "Сканировать QR-код" и "Недавние поездки"
            Padding(
              padding: EdgeInsets.only(right: 200.0), // Отступ от левого края
              child: Text(
                'Недавние поездки',
                style: TextStyle(
                  fontSize: 20, // Устанавливаем размер шрифта
                  fontWeight: FontWeight.bold, // Жирный шрифт
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}








