import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
@override
_ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _avatarImagePath;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  Future _pickImage() async {
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
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _pickImage();
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _avatarImagePath != null
                    ? AssetImage(_avatarImagePath!)
                    : AssetImage('assets/default_avatar.jpg'),
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
                // Отправляем данные назад
                Navigator.pop(
                  context,
                  _firstNameController.text.trim(),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 68, 65, 255),
                onPrimary: Colors.white,
                padding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: Size(150, 50),
                fixedSize: Size(200, 50),
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
