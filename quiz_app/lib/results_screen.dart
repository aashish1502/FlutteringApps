import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {

  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You answered X out of Y questions correctly"),
            const SizedBox(
              height: 30,
            ),
            const Text("List of answers and questions"),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40))),
              child: const Text("Restart quiz"),
            )
          ],
        ),
      ),
    );
  }
}
