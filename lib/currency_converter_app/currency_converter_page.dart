import 'package:flutter/material.dart';

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  double value = 0;
  final TextEditingController controller1 = TextEditingController();

  void convert(){
    final double  usd = double.tryParse(controller1.text) ?? 0;
    setState(() {
      value = usd*83;
    });
  }

  void reset(){
    setState(() {
    controller1.clear();
    value = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text("Currency Converter"),
        )
        ),
        actions: [IconButton(onPressed: reset,
        icon: Icon(Icons.restart_alt))],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("INR $value",
            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(controller: controller1,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(hintText:"Please enter the amount in USD",
              border: OutlineInputBorder(borderSide: BorderSide()),
              prefixIcon: Icon(Icons.money))
              ),
            ),
            TextButton(onPressed: convert,
            style: TextButton.styleFrom(foregroundColor: Colors.black87,
            backgroundColor: Colors.blueGrey,
            shape: LinearBorder(side: BorderSide()),
            fixedSize: Size(350, 10)),
            child: Text("Convert"),
            )
          ],
        ),
      ),
    );
  }
}