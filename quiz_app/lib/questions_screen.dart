import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/option_button.dart';

class QuestionScreen extends StatefulWidget {
  final void Function(String answer) onSelectAnswer;

  const QuestionScreen({super.key, required this.onSelectAnswer});

  @override
  State<QuestionScreen> createState() => _QuestionScreen();
}

class _QuestionScreen extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.poppins(
                  color: const Color.fromARGB(190, 255, 255, 255),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ...currentQuestion.getShuffeledAnswers().map((e) => OptionButton(
                selectAnswer: () {
                  answerQuestion(e);
                },
                text: e)),
          ],
        ),
      ),
    );
  }
}
