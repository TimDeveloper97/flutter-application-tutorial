import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {Key? key}) : super(key: key);
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Opacity(
              child: Image.asset(
                'assets/images/quiz-logo.png',
                color: const Color.fromARGB(255, 204, 233, 240),
              ),
              opacity: 0.3,
            ),
          ),
          const Text('Learn Flutter the fun way',
              style: TextStyle(fontSize: 24, color: Colors.white)),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
              icon: const Icon(Icons.arrow_right_alt_outlined,
                  color: Colors.white),
              onPressed: startQuiz,
              label: const Text('Start Quiz',
                  style: TextStyle(fontSize: 20, color: Colors.white))),
        ],
      ),
    );
  }
}
