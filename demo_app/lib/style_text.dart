import 'package:flutter/material.dart';

class StyleText extends StatelessWidget {
  const StyleText(this.outputText, {Key? key}) : super(key: key);
  final String outputText;

  @override
  Widget build(BuildContext context) {
    return Text(
      outputText,
      style: const TextStyle(color: Colors.white, fontSize: 24,),
    );
  }
}
