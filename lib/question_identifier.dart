import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionIdentifier extends StatelessWidget {
  QuestionIdentifier(
      {required this.questionIndex,
      required this.userAnswer,
      required this.correctAnswer,
      super.key});
  String userAnswer;
  String correctAnswer;
  Object? questionIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, right: 20, top: 10, left: 0),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        color: correctAnswer == userAnswer ? Colors.green : Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Text(
        ((questionIndex as int) + 1).toString(),
        style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
