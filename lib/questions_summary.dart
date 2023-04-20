import 'package:flutter/material.dart';
import 'question_identifier.dart';
import 'answer_identifier.dart';

class QuestionSummary extends StatelessWidget {
  QuestionSummary(this.summaryData, {super.key});
  List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(36, 0, 0, 0),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 500,
        child: SingleChildScrollView(
          child: Column(
              children: summaryData.map(
            (data) {
              return Row(
                children: [
                  QuestionIdentifier(
                      questionIndex: data['question_index'],
                      userAnswer: data['user_answer'] as String,
                      correctAnswer: data['correct_answer'] as String),
                  Expanded(
                    child: AnswerIdentifier(
                        correctAnswer: data['correct_answer'] as String,
                        userAnswer: data['user_answer'] as String,
                        question: data['question'] as String),
                  )
                ],
              );
            },
          ).toList()),
        ),
      ),
    );
  }
}
