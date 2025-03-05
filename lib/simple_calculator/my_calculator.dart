import 'package:lms_apps/simple_calculator/calculator_page.dart';
import 'package:flutter/material.dart';

class MyCalculatorApp extends StatelessWidget {
  const MyCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator App",
      home : const CalculatorPage()
    );
  }
}

extension StringExtensions on String {
  bool get isNumeric {
    if (isEmpty) return false;
    return double.tryParse(this) != null;
  }
}