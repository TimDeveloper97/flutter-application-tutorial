import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {Key? key, required this.chosenAnswers, required this.onRestart})
      : super(key: key);
  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': QUESTIONS[i].text,
        'correct_answer': QUESTIONS[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numberTotalQuestions = QUESTIONS.length;
    final numberCorrectQuestions = summaryData
        .where((element) => element['correct_answer'] == element['user_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Your answered $numberCorrectQuestions/$numberTotalQuestions questions correctly!',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
                style: OutlinedButton.styleFrom(),
                icon: const Icon(Icons.replay_outlined, color: Colors.white),
                onPressed: onRestart,
                label: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Start Quiz',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                )),
          ],
        ),
      ),
    );
  }
}
