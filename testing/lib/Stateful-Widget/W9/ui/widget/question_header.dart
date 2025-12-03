import 'package:flutter/material.dart';

class QuestionHeader extends StatelessWidget {
  final int questionNumber;
  final String questionText;
  final Color? numberBackgroundColor;

  const QuestionHeader({
    super.key,
    required this.questionNumber,
    required this.questionText,
    this.numberBackgroundColor,

  });

  // For showing result with correct/incorrect color
  const QuestionHeader.result({
    super.key,
    required this.questionNumber,
    required this.questionText,
    required bool isCorrect,
  })  : numberBackgroundColor = isCorrect ? Colors.green : Colors.red;
       

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Question Number Circle
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: numberBackgroundColor ?? Colors.blue,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$questionNumber',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            questionText,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
