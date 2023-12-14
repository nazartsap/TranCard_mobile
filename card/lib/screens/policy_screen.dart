import 'package:flutter/material.dart';

class PolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Политика использования'),
        backgroundColor: Color.fromARGB(255, 68, 65, 255),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            '1. Общие положения',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Это приложение предоставляет услуги в соответствии с нижеследующими условиями использования.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text('2. Сбор и использование данных',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Приложение собирает и использует определенные данные согласно нашей политике конфиденциальности.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text(
            '3. Ответственность',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Мы не несем ответственность за утерю данных или другие последствия использования этого приложения.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text(
            '4. Изменения в политике',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Мы оставляем за собой право вносить изменения в нашу политику использования без предварительного уведомления.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

