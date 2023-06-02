import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({Key? key, required this.answer, required this.onTap})
      : super(key: key);
  final String answer;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: ElevatedButton(
          onPressed: onTap,
          child: Text(answer, textAlign: TextAlign.center),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(199, 42, 23, 126),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          )),
    );
  }
}
