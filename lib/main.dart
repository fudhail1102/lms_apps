// ignore_for_file: unused_import
import 'package:flutter/material.dart';

import 'package:lms_apps/counters.dart';
import 'package:lms_apps/currency_converter_app/currency_converter.dart';
import 'package:lms_apps/factorial.dart';
import 'package:lms_apps/forms.dart';
import 'package:lms_apps/simple_calculator/my_calculator.dart';
import 'package:lms_apps/todo.dart';
import 'package:lms_apps/web_service.dart';

List<StatelessWidget> apps = [
  CurrencyConverterApp(),
  CountersApp(),
  FactorialApp(),
  FormsApp(),
  FetchApp(),
  TodoApp(),
  MyCalculatorApp()
  ];

void main() {
  runApp(const TodoApp());
}