import 'package:demo_app/dice_roller.dart';
import 'package:demo_app/style_text.dart';
import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const bottomAlignment = Alignment.centerRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({Key? key, required this.colors}) : super(key: key);
  // const GradientContainer(this.colors, {Key? key}) : super(key: key);
  GradientContainer.purple()
      : colors = [
          Color.fromARGB(255, 12, 11, 12),
          Color(0xff5b0060),
          Color(0xff870160),
        ];
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    // startAlignment = Alignment.center;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: startAlignment,
          // end: Alignment(0.8, 1),
          end: bottomAlignment,
          colors:
              colors, // Gradient from https://learnui.design/tools/gradient-generator.html
          tileMode: TileMode.mirror,
        ),
        color: const Color(0xff7c94b6),
        // image: const DecorationImage(
        //   image: NetworkImage(
        //       'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
        //   fit: BoxFit.cover,
        // ),
        border: Border.all(
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      alignment: Alignment.center,
      // child: const Center(
      //   child: Text("Hello world"),
      // ),
      // child: const StyleText('Hello world'),
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: DiceRoller(),
    );
  }
}
