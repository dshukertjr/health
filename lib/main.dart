import 'package:flutter/material.dart';
import 'package:health/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health',
      theme: ThemeData(
        primaryColor: Color(0xFF260a73),
        accentColor: Color(0xFFF7c132),
      ),
      home: HomePage(),
    );
  }
}
