import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: Color(0xFF1D2135)),
        // floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Color(0xFFE83D66)),
        scaffoldBackgroundColor: Color(0xFF1D2135),
        // textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      )
    );
  }
}


