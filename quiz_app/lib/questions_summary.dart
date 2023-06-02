import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({Key? key, required this.summaryData})
      : super(key: key);
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((item) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.zero,
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: item['correct_answer'] == item['user_answer']
                            ? Colors.green
                            : Colors.red),
                    height: 30,
                    width: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Text(
                        ((item['question_index'] as int) + 1).toString(),
                        textAlign: TextAlign.end,
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['question'] as String,
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        item['user_answer'] as String,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        item['correct_answer'] as String,
                        style: TextStyle(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
