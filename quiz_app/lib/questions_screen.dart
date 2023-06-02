import 'package:flutter/material.dart';
import 'package:quiz_app/models/answer_button.dart';

import 'data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  final currentQuestion = QUESTIONS[0];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.text,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          ...currentQuestion.answers.map((item) {
            return AnswerButton(answer: item, onTap: () {});
          }),
        ],
      ),
    );
  }
}
