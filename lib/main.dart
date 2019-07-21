import 'package:flutter/material.dart';
import 'package:bmi/screens/input_page.dart';

void main()=>runApp(BMI());

class BMI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFFEFE5DC),
        scaffoldBackgroundColor: Color(0xFFEFE5DC),
      ),
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}

