import 'dart:convert';

import 'package:card/screens/card_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api_constants.dart';
import 'package:http/http.dart' as http;
import 'profile_screen.dart';

class CardScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CardScreen> {
  String _userName = 'Андрей'; // Изначальное значение имени

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Транспортная карта",
                        style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                          size: 30,
                        ))
                  ],
                ),
                _hasCard
                    ? _buildCardWidget()
                    : Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/no_card.png"),
                              // fit: BoxFit.cover
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 5),
                        child: Text(
                          "У вас пока нет карт",
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 30),
                        child: Text(
                          "Для получения информации по карте добавьте ее, нажав на кнопку ниже",
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
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
                                    child: Text(
                                      "Выпустить виртуальную транспортную карту",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Недавние поездки",
                        style: GoogleFonts.montserrat(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 5),
                  child: Text("У вас пока нет поездок",
                      style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.bold ,
                          color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 30),
                  child: Text("Спикок карт пуст. Для получения списка поездок по карте добавьте ее",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.normal ,
                      color: Colors.black,),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
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
