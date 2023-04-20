import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          color: Color.fromARGB(147, 255, 255, 255),
          width: 300,
        ),
        SizedBox(
          height: 80,
        ),
        Text(
          'Learn Flutter BITCH !!',
          style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
        ),
        SizedBox(
          height: 20,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          icon: Icon(Icons.arrow_right_alt_rounded),
          label: Text('Start the Fucking Quiz'),
          style: OutlinedButton.styleFrom(
              padding: EdgeInsets.all(10), foregroundColor: Colors.white),
        ),
      ],
    ));
  }
}
