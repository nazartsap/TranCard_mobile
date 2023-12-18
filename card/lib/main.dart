import 'package:card/screens/card_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/bottom_navigation_bar.dart';
import 'screens/policy_screen.dart';
import 'screens/help_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/card_screen.dart';
import 'screens/card_selection_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<bool> _checkSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token != null && token.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _checkSession(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Лучше использовать загрузчик
          } else {
            bool isAuthenticated = snapshot.data!;
            return isAuthenticated ? BottomNavigationBarWidget() : LoginScreen();
          }
        },
      ),
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/main': (context) => BottomNavigationBarWidget(),
        '/policy': (context) => PolicyScreen(),
        '/help': (context) => SupportScreen(),
        '/profile': (context) => ProfileScreen(),
        '/card': (context) => CardScreen(),
        '/card': (context) => CardSelectionScreen(),
      },
    );
  }
}
