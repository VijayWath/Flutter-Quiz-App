import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerIdentifier extends StatelessWidget {
  AnswerIdentifier(
      {required this.correctAnswer,
      required this.userAnswer,
      required this.question,
      super.key});
  String correctAnswer;
  String userAnswer;
  String question;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: GoogleFonts.lato(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            userAnswer,
            style: GoogleFonts.lato(
                fontSize: 20,
                color: correctAnswer == userAnswer ? Colors.green : Colors.red),
          ),
          Text(
            correctAnswer,
            style: GoogleFonts.lato(color: Colors.green, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
