import 'package:flutter/material.dart';

class StyleText extends StatelessWidget {
  const StyleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Hello world1',
      style: TextStyle(color: Colors.white, fontSize: 28),
    );
  }
}
