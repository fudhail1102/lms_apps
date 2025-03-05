import 'package:lms_apps/simple_calculator/my_calculator.dart';
import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String equation = '0';
  final List<String> buttons = [
    '1', '2', '3', '4',
    '5', '6', '7', '8',
    '9', '0', '.', '=',
    '+', '-', '*', '/',
    'C'
  ];

  void onButtonPressed(String value) {
    setState(() {
      if (value == '=') {
        equation = evaluate(equation);
      } else if (value == 'C') {
        equation = '0';
      } else {
        if (equation == '0' && value != '.') {
          equation = value;
        } else {
          equation += value;
        }
      }
    });
  }

  String evaluate(String expression) {
    try {
      final parsedExpression = Expression.parse(expression);
      final evaluator = const ExpressionEvaluator();

      final result = evaluator.eval(parsedExpression, {});

      if (result is double && result == result.toInt()) {
        return result.toInt().toString(); // Show integer if whole number (e.g., 5.0 -> 5)
      }

      return result.toString();
    } catch (e) {
      return 'Error!\nInvalid expression';
    }
  }

  Widget calculatorButton({required String value}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: value.isNumeric ? Colors.black : Colors.white,
          backgroundColor: value.isNumeric ? Colors.blueGrey : Colors.black,
          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(35)),
        ),
        onPressed: () {
          onButtonPressed(value);
        },
        child: Text(value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  equation,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return calculatorButton(value: buttons[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
