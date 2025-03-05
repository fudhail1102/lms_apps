import 'package:flutter/material.dart';

Widget calcButton(
  String buttonText, Color buttonColor, void Function()? buttonPressed) {
  return Container(
  width: 200,
  height: 75,
  padding: const EdgeInsets.all(0),
  child: ElevatedButton(
    onPressed: buttonPressed,
    style: ElevatedButton.styleFrom(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)),
    ),
    backgroundColor: buttonColor,
    ),
    child: Text(
    buttonText,
    style: const TextStyle(
      fontSize: 30,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    ),
  ),
  );
}