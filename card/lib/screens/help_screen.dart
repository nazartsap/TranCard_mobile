import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Техническая поддержка'),
        backgroundColor: Color.fromARGB(255, 68, 65, 255),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(),
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
                'Чат с поддержкой',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Часто задаваемые вопросы:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: FAQList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Чат с поддержкой'),
      ),
      body: Center(
        child: Text('Экран чата с поддержкой'),
      ),
    );
  }
}

class FAQList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FAQItem(
          question: 'Как пополнить баланс?',
          answer: 'Для пополнения баланса перейдите в раздел "Пополнение баланса" и следуйте указаниям.',
        ),
        FAQItem(
          question: 'Как изменить пароль?',
          answer: 'Чтобы изменить пароль, перейдите в настройки аккаунта и выберите "Сменить пароль".',
        ),
        FAQItem(
          question: 'Как связаться с поддержкой?',
          answer: 'Для связи с нашей технической поддержкой, вы можете начать чат в разделе "Техническая поддержка".',
        ),
        // Добавьте другие часто задаваемые вопросы по аналогии
      ],
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(question),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(answer),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SupportScreen(),
  ));
}
