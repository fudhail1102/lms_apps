import 'package:lms_apps/currency_converter_app/currency_converter_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const CurrencyConverterApp());
}

class CurrencyConverterApp extends StatelessWidget {
  const CurrencyConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Currency Converter",
      theme: ThemeData.dark(useMaterial3: true),
      home: const CurrencyConverterPage(),
    );
  }
}