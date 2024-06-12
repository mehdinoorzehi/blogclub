import 'package:blogclub/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color mainColor = Color(0xff0D253C);
    const Color seceondColor = Color(0xff2D4379);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Avenir',
        textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w600, color: mainColor),
            titleSmall: TextStyle(color: seceondColor, fontSize: 17),
            titleMedium: TextStyle(fontSize: 12, color: seceondColor)),
        scaffoldBackgroundColor: const Color(0xffF8FAFF),
        primaryColor: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
