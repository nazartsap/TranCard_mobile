import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _avatarImagePath; // Путь к изображению аватара
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  // Функция для открытия галереи и выбора изображения
  Future _pickImage() async {
    // Здесь вы можете использовать любой метод для выбора изображения, например, ImagePicker
    // В данном примере будет использован простой путь к изображению в ассетах
    setState(() {
      _avatarImagePath = 'assets/default_avatar.jpg';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
        backgroundColor: Color.fromARGB(255, 68, 65, 255),
        centerTitle: true,
        elevation: 0, // Убираем тень под AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _pickImage(); // Вызовите функцию для выбора изображения
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _avatarImagePath != null
                    ? AssetImage(_avatarImagePath!)
                    : AssetImage('assets/default_avatar.jpg'), // Изображение по умолчанию
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                labelText: 'Имя',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                labelText: 'Фамилия',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Номер телефона',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                 // Ок
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
              child: Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
  ));
}
