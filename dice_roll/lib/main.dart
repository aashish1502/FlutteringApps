import 'package:dice_roll/GradientContainerWithCenteredText.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: GradientContainerWithCenteredText(const [
        Color.fromARGB(255, 245, 170, 53),
        Color.fromARGB(255, 157, 34, 211)
      ]),
    ),
  ));
}
