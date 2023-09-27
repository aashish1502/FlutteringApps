import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';

import './home_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? currentActiveScreen;

  @override
  void initState() {
    currentActiveScreen = HomePage(changeActiveScreen);
    super.initState();
  }

  void changeActiveScreen() {
    setState(() {
      currentActiveScreen = const QuestionScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 220, 36, 36),
            Color.fromARGB(255, 74, 86, 157)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: currentActiveScreen,
      )),
    );
  }
}
