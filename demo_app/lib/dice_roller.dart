import 'dart:math';

import 'package:demo_app/style_text.dart';
import 'package:flutter/material.dart';

final random = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 1;

  rollDice() {
    var number = random.nextInt(6) + 1;
    setState(() {
      currentDiceRoll = number;
    });
    print('rollDice: $currentDiceRoll');
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset(
        'assets/images/dice-$currentDiceRoll.png',
      ),
      const SizedBox(
        height: 20,
      ),
      OutlinedButton(
        onPressed: rollDice,
        child: const StyleText('Roll Dice'),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(15),
          backgroundColor: Colors.transparent,
        ),
      )
    ]);
  }
}
