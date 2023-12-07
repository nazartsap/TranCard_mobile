import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/bottom_navigation_bar.dart';
import 'screens/policy_screen.dart';
import 'screens/help_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/card_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(), // Используем BottomNavigationBarWidget как главный экран
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/main': (context) => BottomNavigationBarWidget(),
        '/policy': (context) => PolicyScreen(),
        '/help': (context) => SupportScreen(),
        '/profile': (context) => ProfileScreen(),
        '/card': (context) => CardScreen(),
      },
    );
  }
}

