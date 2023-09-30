import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.data});

  final List<Map<String, Object>> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: data.map((data) {
            Color myColor = data["correct_answer"] == data["chosen_answer"]
                ? Colors.greenAccent
                : Colors.redAccent;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: AlignmentDirectional.topCenter,
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: myColor,
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                        child: Text(
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            ((data['question_index'] as int) + 1).toString()))),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'].toString(),
                        // textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                      Text(
                        data['chosen_answer'].toString(),
                        style: GoogleFonts.poppins(
                            color: const Color.fromARGB(200, 147, 237, 193)),
                      ),
                      Text(
                        data['correct_answer'].toString(),
                        style: GoogleFonts.poppins(
                            color: const Color.fromARGB(200, 232, 119, 23)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
