import 'package:card/api_constants.dart';
import 'package:card/widgets/tariff.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profile_screen.dart';
import 'card_selection_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'scanqr_screen.dart';
class YourMainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TariffWidget(
          title: 'Единоразовый проездной',
          transport: 'Автобус, Троллейбус',
          trips: '16',
          validity: 'Месяц',
          cost: '400',
        ),
        TariffWidget(
          title: 'Единоразовый проездной',
          transport: 'Автобус, Троллейбус',
          trips: '30',
          validity: 'Месяц',
          cost: '750',
        ),
        TariffWidget(
          title: 'Единоразовый проездной',
          transport: 'Автобус, Троллейбус',
          trips: '60',
          validity: 'Месяц',
          cost: '1500',
        ),
      ],
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _userName = '*****';
  bool _hasCard = false;
  String _cardType = ''; // Добавьте переменную для типа карты
  String _cardNumber = ''; // Добавьте переменную для номера карты
  String _expirationDate = ''; // Добавьте переменную для срока действия

  @override
  void initState() {
    super.initState();
    // Получаем информацию о карте пользователя при инициализации экрана
    _fetchCardDetails();
  }

  Future<void> _fetchCardDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String accessToken = prefs.getString('token') ?? '';

    try {
      final response = await http.get(
        Uri.parse(ApiConstants.cardUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> cardDetails = jsonDecode(response.body);

        // Проверяем, что виджет все еще существует
        if (mounted) {
          setState(() {
            _hasCard = true;
            _cardType = cardDetails['cardType'];
            _cardNumber = cardDetails['cardNumber'].toString();
            _expirationDate = cardDetails['expirationDate'];
          });
        }
      } else {
        print('Ошибка при получении информации о карте: ${response.statusCode}');
      }
    } catch (e) {
      // Проверяем, что виджет все еще существует
      if (mounted) {
        print('Ошибка при получении информации о карте: $e');
      }
    }
  }


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
                        _userName,
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
                          _userName = updatedUserName;
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
            _hasCard
                ? _buildCardWidget()
                : Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: Container(
                width: double.infinity,
                height: 80,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CardSelectionScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xff4541fa),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.add_circle_rounded, color: Colors.white, size: 45,),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text("Выпустить виртуальную транспортную карту",
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QRCodeScanner(),
                  ),
                );
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
                'Сканировать QR-код',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(height: 30),
            YourMainWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildCardWidget() {
    DateTime expirationDateTime = DateTime.parse(_expirationDate);
    String _formattedExpirationDate = "${expirationDateTime.month}/${expirationDateTime.year % 100}";

    String cardImage = 'assets/stadart_card_normal.svg'; // Изображение по умолчанию

    if (_cardType == 'privileged') {
      cardImage = 'assets/privileged_card_normal.svg';
    } else if (_cardType == 'student') {
      cardImage = 'assets/student_card_normal.svg';
    }

    // Форматируем номер карты
    String formattedCardNumber = _formatCardNumber(_cardNumber);

    return Column(
      children: [
        // Используйте Stack для размещения текста поверх изображения
        Stack(
          children: [
            SvgPicture.asset(
              cardImage,
            ),
            Positioned(
              top: 100, // Подстройте эту позицию в зависимости от вашего дизайна
              left: 20, // Подстройте эту позицию в зависимости от вашего дизайна
              child: Text(
                formattedCardNumber,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 140, // Подстройте эту позицию в зависимости от вашего дизайна
              left: 20, // Подстройте эту позицию в зависимости от вашего дизайна
              child: Text(
                _formattedExpirationDate,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

// Функция для форматирования номера карты
  String _formatCardNumber(String cardNumber) {
    // Удалите все пробелы из номера карты
    String cleanNumber = cardNumber.replaceAll(' ', '');

    // Добавляем пробел после каждых 4 цифр
    List<String> chunks = [];

    for (int i = 0; i < cleanNumber.length; i += 4) {
      chunks.add(cleanNumber.substring(i, i + 4));
    }

    return chunks.join(' ');
  }
}