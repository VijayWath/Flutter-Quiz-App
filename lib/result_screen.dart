import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {required this.onRestart, required this.chosenAnswer, super.key});

  List<String> chosenAnswer;
  void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswer[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final summaryData = getSummaryData();
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Your Summary',
                style: GoogleFonts.lato(
                    color: Color.fromARGB(130, 245, 245, 245),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  style: GoogleFonts.lato(
                      color: Color.fromARGB(152, 221, 144, 235),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  '$numCorrectQuestions are correct out of $numTotalQuestions'),
              SizedBox(
                height: 30,
              ),
              QuestionSummary(summaryData),
              SizedBox(
                height: 30,
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  foregroundColor: Color.fromARGB(168, 255, 255, 255),
                  backgroundColor: Color.fromARGB(255, 25, 4, 84),
                ),
                onPressed: onRestart,
                icon: Icon(Icons.restart_alt),
                label: Text('Restart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
