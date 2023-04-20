import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_screen.dart';
import 'questions.dart';
import 'start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'StartScreen';
  List<String> selectedAnswer = [];

  void onRestart() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'QuestionScreen';
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'QuestionScreen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'ResultScreen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'QuestionScreen') {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'ResultScreen') {
      screenWidget = ResultScreen(
        onRestart: onRestart,
        chosenAnswer: selectedAnswer,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.topLeft,
              begin: Alignment.bottomRight,
              colors: [
                Colors.indigo,
                Colors.purple,
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
