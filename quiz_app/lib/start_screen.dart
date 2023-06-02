import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this._startQuiz, {Key? key}) : super(key: key);
  final void Function() _startQuiz;

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
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
              icon: const Icon(Icons.arrow_right_alt_outlined,
                  color: Colors.white),
              onPressed: _startQuiz,
              label: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Start Quiz',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              )),
        ],
      ),
    );
  }
}
