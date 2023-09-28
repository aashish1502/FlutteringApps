import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.startQuiz, {super.key});
  final void Function() startQuiz;

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
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 24),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25),
          ),
          OutlinedButton.icon(
              onPressed: startQuiz,
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
