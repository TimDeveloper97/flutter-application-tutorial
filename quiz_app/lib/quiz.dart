import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var _activeScreen = 'start-screen';
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      _activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == QUESTIONS.length) {
      setState(() {
        _activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    selectedAnswers.clear();
    setState(() {
      _activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (_activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    } else if (_activeScreen == 'result-screen') {
      screenWidget =
          ResultsScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz);
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.green,
        ], begin: Alignment.topLeft, end: Alignment.bottomLeft)),
        child: screenWidget,
        alignment: Alignment.center,
      ),
    );
  }
}
