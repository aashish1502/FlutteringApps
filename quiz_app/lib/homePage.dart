import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 80),
          ),
          const Text(
            "Learn Flutter the fun way!",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25),
          ),
          OutlinedButton.icon(
              onPressed: () {},
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
              label: const Text(
                "Start Quiz",
                style: TextStyle(color: Colors.white),
              ),
              icon: const Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
