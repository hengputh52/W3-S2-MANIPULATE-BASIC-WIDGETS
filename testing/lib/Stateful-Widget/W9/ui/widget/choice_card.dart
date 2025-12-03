import 'package:flutter/material.dart';

class ChoiceCard extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isUserAnswer;
  final bool isCorrectAnswer;
  final bool showResult;

  const ChoiceCard({
    super.key,
    required this.text,
    this.onTap,
    this.isUserAnswer = false,
    this.isCorrectAnswer = false,
    this.showResult = false,
  });

  // For quiz screen - simple white button
  const ChoiceCard.quiz({
    super.key,
    required this.text,
    required this.onTap,
  })  : isUserAnswer = false,
        isCorrectAnswer = false,
        showResult = false;

  // For result screen - shows correct/incorrect status
  const ChoiceCard.result({
    super.key,
    required this.text,
    required this.isUserAnswer,
    required this.isCorrectAnswer,
  })  : onTap = null,
        showResult = true;

  @override
  Widget build(BuildContext context) {
    // If showing results (ResultScreen)
    if (showResult) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            if (isUserAnswer)
              Icon(
                isCorrectAnswer ? Icons.check : Icons.close,
                color: isCorrectAnswer ? Colors.white : Colors.red,
                size: 20,
              )
            else
              const SizedBox(width: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: isCorrectAnswer ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            // if (isCorrectAnswer && isUserAnswer == false && !_isUserCorrect())
            //   const SizedBox.shrink(),
            if (isCorrectAnswer && !isUserAnswer)
              const Text(
                'Correct answer',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      );
    }

    // If quiz mode (QuizScreen) - clickable button
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  //bool _isUserCorrect() => isUserAnswer && isCorrectAnswer;
}
