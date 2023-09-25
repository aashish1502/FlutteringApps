import 'dart:math';

import 'package:flutter/material.dart';

final randomObjectGenerator = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerStatee();
  }
}

class _DiceRollerStatee extends State<DiceRoller> {
  var activeDiceNumber  = 2;
  void rollDice() {
    setState(() {
      activeDiceNumber = randomObjectGenerator.nextInt(6)+1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/images/dice-six-faces-$activeDiceNumber.png", width: 200),
        TextButton(
            onPressed: rollDice,
            style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 28)),
            child: const Text("Roll Dice!"))
      ],
    );
  }
}
