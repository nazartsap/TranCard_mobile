import 'package:flutter/material.dart';
import 'profile_screen.dart';

class CardScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CardScreen> {
  String _userName = 'Андрей'; // Изначальное значение имени

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60.0),
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
                        _userName, // Используем переменную с именем
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      String? updatedUserName = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileScreen()),
                      );

                      if (updatedUserName != null) {
                        setState(() {
                          _userName = updatedUserName; // Обновляем переменную с именем
                        });
                      }
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
            SizedBox(height: 80),
            Text(
              'У вас нет карты',
              style: TextStyle(
                fontSize: 34,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Обработчик нажатия
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

          ],
        ),
      ),
    );
  }
}
