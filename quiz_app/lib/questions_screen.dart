import 'package:flutter/material.dart';
import 'package:quiz_app/models/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key, required this.onSelectAnswer})
      : super(key: key);
  final void Function(String answer) onSelectAnswer;
  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var _currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      _currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = QUESTIONS[_currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return AnswerButton(
                  answer: answer,
                  onTap: () {
                    answerQuestion(answer);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
