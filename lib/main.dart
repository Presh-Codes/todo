import 'package:flutter/material.dart';
import 'package:todo/pages/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.deepOrange, scaffoldBackgroundColor: Color(0xFF0A0501)),
      );
  }
}
