import 'package:dice_roll/DiceRoller.dart';
import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainerWithCenteredText extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colorArray,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
          child: DiceRoller()
      ),
    );
  }

  GradientContainerWithCenteredText(this.colorArray, {super.key});

  List<Color> colorArray;
}
