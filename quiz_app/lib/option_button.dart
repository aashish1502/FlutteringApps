import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  OptionButton({
    super.key,
    required this.selectAnswer,
    required this.text,
  });

  String text;
  void Function() selectAnswer;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: selectAnswer,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(187, 236, 111, 255),
            foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
        child: Text(text, textAlign: TextAlign.center),
      ),
    );
  }
}
