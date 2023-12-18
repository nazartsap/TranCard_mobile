import 'dart:async';
import 'package:card/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VerificationCodeScreen extends StatefulWidget {
  final String email;

  VerificationCodeScreen({required this.email});

  @override
  _VerificationCodeScreenState createState() =>
      _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  List<TextEditingController> _controllers =
  List.generate(6, (index) => TextEditingController());

  bool _isTimerActive = true;
  int _timerSeconds = 60;

  void _startTimer() {
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_timerSeconds == 0) {
          setState(() {
            _isTimerActive = false;
            timer.cancel();
          });
        } else {
          setState(() {
            _timerSeconds--;
          });
        }
      },
    );
  }

  String _formatTimer() {
    int minutes = _timerSeconds ~/ 60;
    int seconds = _timerSeconds % 60;
    return '${_twoDigits(minutes)}:${_twoDigits(seconds)}';
  }

  String _twoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }

  Future<void> _resendVerificationCode() async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.resendVerificationCodeUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'email': widget.email,
        }),
      );

      if (response.statusCode == 200) {
        // Запрос на повторную отправку кода успешно выполнен
        // Дополнительная логика, если необходимо
        print('Verification code resent successfully');
      } else {
        // Обработка ошибок при повторной отправке кода
        print(
            'Error resending verification code: ${response.statusCode}');
        print('Response body: ${response.body}');
        // Выведите сообщение об ошибке пользователю, если необходимо
      }
    } catch (error) {
      // Обработка ошибок связанных с сетью или другие исключения
      print('Error resending verification code: $error');
    }

    // Сброс таймера
    setState(() {
      _timerSeconds = 60;
      _isTimerActive = true;
    });

    // Запуск нового таймера
    _startTimer();
  }

  Future<void> _verifyAccount() async {
    final String verificationCode =
    _controllers.map((controller) => controller.text).join();

    try {
      final response = await http.post(
        Uri.parse(ApiConstants.verifyUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'email': widget.email,
          'verificationCode': verificationCode,
        }),
      );

      if (response.statusCode == 201) {
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        print('Error during verification: ${response.statusCode}');
        print('Response body: ${response.body}');
        // Выведите сообщение об ошибке пользователю, если необходимо
      }
    } catch (error) {
      print('Error during verification: $error');
    }
  }

  @override
  void initState() {
    super.initState();

    // Запуск таймера при инициализации
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Верификация аккаунта'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Подтвердите свой адрес эл. почты',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Мы отправили вам 6-значный код для подтверждения вашего адреса электронной почты (${widget.email}). Введите его в поле ниже.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                6,
                    (index) => SizedBox(
                  width: 40,
                  child: TextField(
                    controller: _controllers[index],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      // Move to the next TextField when a digit is entered
                      if (value.isNotEmpty && index < 5) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Не получили код?',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                InkWell(
                  onTap: _isTimerActive ? null : _resendVerificationCode,
                  child: Text(
                    ' Отправить',
                    style: TextStyle(
                      fontSize: 16,
                      color: _isTimerActive ? Colors.black : Color(0xff413dff),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (_isTimerActive)
                  Text(
                    ' ${_formatTimer()}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff413dff),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _verifyAccount,
              style: ElevatedButton.styleFrom(
                primary: Color(0xff413dff),
                onPrimary: Colors.white,
                padding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(150, 50),
                fixedSize: Size(200, 50),
              ),
              child: Text('Продолжить'),
            ),
          ],
        ),
      ),
    );
  }
}
