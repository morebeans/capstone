import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Feeding',
      theme: ThemeData(
        fontFamily: 'ComicNeue',
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF8B5E3C),
          onPrimary: Colors.white,
          secondary: Color(0xFFC8AD7F),
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.white,
          background: Color(0xFFFFF8F0),
          onBackground: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}
