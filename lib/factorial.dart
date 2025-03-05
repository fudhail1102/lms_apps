import 'package:flutter/material.dart';

class FactorialApp extends StatelessWidget {
  const FactorialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Factorial Checker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 58, 183, 183),
        ),
        useMaterial3: true,
        fontFamily: "SF Pro",
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Factorial Checker",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
          backgroundColor: Colors.cyanAccent,
        ),
        body: FactorialChecker(),
      ),
    );
  }
}

class FactorialChecker extends StatefulWidget {
  const FactorialChecker({super.key});

  @override
  FactorialCheckerState createState() => FactorialCheckerState();
}

class FactorialCheckerState extends State<FactorialChecker> {
  TextEditingController numberController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(125),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: numberController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Enter a number"),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              int number = int.tryParse(numberController.text) ?? 0;
              int isFactorial = checkFactorial(number);
              setState(() {
                result = '$number! = $isFactorial';
              });
            },
            child: Text("Calculate Factorial"),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              numberController.clear();
              setState(() {
                result = '';
              });
            },
            child: Text("Reset"),
          ),
          SizedBox(height: 20),
          Text(
            result,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

int checkFactorial(int number) {
  if (number == 0 || number == 1) {
    return 1;
  } else {
    return number * checkFactorial(number - 1);
  }
}