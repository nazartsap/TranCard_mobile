import 'package:card/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom_navigation_bar.dart';

class CardSelectionScreen extends StatefulWidget {
  @override
  _CardSelectionScreenState createState() => _CardSelectionScreenState();
}

class _CardSelectionScreenState extends State<CardSelectionScreen> {

  String getCardType() {
    switch (_selectedCardIndex) {
      case 0:
        return 'standard';
      case 1:
        return 'privileged';
      case 2:
        return 'student';
      default:
        return 'standard'; // Значение по умолчанию, если что-то пошло не так
    }
  }

  Future<void> _issueCard() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String accessToken = prefs.getString('token') ?? '';

      final response = await http.post(
        Uri.parse(ApiConstants.addCardUrl),// Replace with your backend URL
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode({'cardType': getCardType()}),
      );

      if (response.statusCode == 201) {
        // If the card issuance is successful, navigate back to the home screen
        print('Card successfully issued');
        Navigator.of(context).pop(); // Close the current screen
        Navigator.of(context).pushReplacementNamed('/main'); // Navigate to the home screen
      } else {
        // Handle errors here
        print('Error issuing card: ${response.statusCode}');
      }
    } catch (e) {
      print('Error issuing card: $e');
    }
  }


  int _selectedCardIndex = 0;
  List<String> cards = ['Стандартная карта', 'Льготная карта', 'Студенческая карта'];
  List<String> descripshon = [
    'Стандартная транспортная карта, которая позволяет пользоваться нашим сервисом и подходит всем',
    'С этой картой вы сможете пользоваться вашими льготами на проезд',
    'Карта со скидкой для студентов. Подтвердите, что вы студент и платите за проезд меньше'
  ];
  List<String> images = [
    'assets/standart.png',
    'assets/preferential.png',
    'assets/student.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Выбор карты'),
      ),
      body: Container(
        color: const Color(0xfff6f6f6),
        child: Column(
          children: [
            Text(
              '${cards[_selectedCardIndex]}',
              style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            // Карусель, которая занимает всю доступную высоту
            Expanded(
              child: CarouselSlider(
                items: images.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 200.0,
                  initialPage: _selectedCardIndex,
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _selectedCardIndex = index;
                    });
                  },
                ),
              ),
            ),

            // Индикатор прокрутки
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.map((url) {
                int index = images.indexOf(url);
                return Container(
                  width: 30.0,
                  height: 4.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    color: _selectedCardIndex == index ? Color.fromARGB(255, 68, 65, 255) : Color.fromARGB(255, 200, 200, 200),
                    borderRadius: BorderRadius.circular(15)
                  ),
                );
              }).toList(),
            ),

            // Ограничивающий контейнер с текстом и кнопкой
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.45,
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Стильная карта с NFC',
                        style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '${descripshon[_selectedCardIndex]}',
                        style: TextStyle(fontSize: 24, color: Color(0xff5C5C5C)),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Подтвердите выбор карты'),
                                  content: Text('Вы уверены, что хотите выбрать карту "${cards[_selectedCardIndex]}"?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Отмена'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        _issueCard();
                                      },
                                      child: Text('Подтвердить'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 68, 65, 255),
                            onPrimary: Colors.white,
                            padding: EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text('Выпустить карту "${cards[_selectedCardIndex]}"'),
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
    );
  }
}
