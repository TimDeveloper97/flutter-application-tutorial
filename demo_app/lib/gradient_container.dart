import 'package:demo_app/style_text.dart';
import 'package:flutter/cupertino.dart';

var startAlignment = Alignment.bottomRight;
var bottomAlignment = Alignment.centerRight;

class GradientContainer extends StatelessWidget {
  GradientContainer({Key? key}) : super(key: key) {
    var x = 10;
  }

  @override
  Widget build(BuildContext context) {
    // startAlignment = Alignment.center;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: startAlignment,
          // end: Alignment(0.8, 1),
          end: bottomAlignment,
          colors: const [
            Color.fromARGB(255, 12, 11, 12),
            Color(0xff5b0060),
            Color(0xff870160),
            Color(0xffac255e),
            Color(0xffca485c),
            Color(0xffe16b5c),
            Color(0xfff39060),
            Color(0xffffb56b),
          ], // Gradient from https://learnui.design/tools/gradient-generator.html
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
      alignment: bottomAlignment,
      // child: const Center(
      //   child: Text("Hello world"),
      // ),
      child: const StyleText(),
    );
  }
}
