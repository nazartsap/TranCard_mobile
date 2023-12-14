import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TariffSelectionScreen extends StatefulWidget {
  @override
  _TariffSelectionScreenState createState() => _TariffSelectionScreenState();
}

class _TariffSelectionScreenState extends State<TariffSelectionScreen> {
  int _selectedTariffIndex = 0;
  List<String> tariffs = ['Стандартная карта', 'Льготная карта', 'Студенческая карта'];
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
        title: Text('Выбор тарифа'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${tariffs[_selectedTariffIndex]}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            CarouselSlider(
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
                initialPage: _selectedTariffIndex,
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _selectedTariffIndex = index;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              '${descripshon[_selectedTariffIndex]}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Добавьте здесь обработчик нажатия на кнопку
                // Например, можно показать диалог с подтверждением покупки тарифа
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Подтвердите выбор тарифа'),
                      content: Text('Вы уверены, что хотите выбрать тариф "${tariffs[_selectedTariffIndex]}"?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Отмена'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Добавьте здесь код для обработки покупки тарифа
                            // Например, можно отправить запрос на сервер
                            // и после успешной покупки выполнить дополнительные действия
                            Navigator.of(context).pop();
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
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text('Выбрать тариф"${tariffs[_selectedTariffIndex]}"'),
            ),
          ],
        ),
      ),
    );
  }

  // Метод для расчета цены тарифа (пример, замените его на свой расчет)
  double calculatePrice(int index) {
    // Здесь можно добавить логику для расчета цены
    // Например, цена может зависеть от выбранного тарифа
    // В данном примере, просто возвращаем индекс тарифа
    return index.toDouble();
  }
}

