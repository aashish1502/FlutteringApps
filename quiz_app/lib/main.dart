import 'package:flutter/material.dart';
import 'package:quiz_app/homePage.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 220, 36, 36),
          Color.fromARGB(255, 74, 86, 157)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: HomePage(),
    )),
  ));
}
