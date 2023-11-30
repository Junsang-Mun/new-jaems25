import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'welcome_screen.dart'; // Import the welcome screen file

void main() async {
  await dotenv.load();
  runApp(KioskApp());
}

class KioskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '잼스25 키오스크',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
      },
    );
  }
}
