import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:flutter/services.dart';

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
                height: 230,
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
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11), // Устанавливаем ограничение на количество введенных символов
                    PhoneNumberFormatter(), // Форматирование номера телефона
                  ],
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Введите номер телефона',
                    border: OutlineInputBorder(),
                    prefixText: '+7 ',
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
                        Checkbox(value: false, onChanged: (value) {}),
                        Text('Запомнить меня'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
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
                    borderRadius: BorderRadius.circular(5),
                  ),
                  minimumSize: Size(150, 50),
                  fixedSize: Size(200, 50),
                ),
                child: Text('Войти'),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Уже есть аккаунт?'),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
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

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // Вставляем "+7 " в начало строки
    if (newValue.text.isNotEmpty && !newValue.text.startsWith('+7 ')) {
      return TextEditingValue(
        text: '${newValue.text}',
        selection: TextSelection.fromPosition(
          TextPosition(offset: newValue.text.length + 3),
        ),
      );
    }
    return newValue;
  }
}
