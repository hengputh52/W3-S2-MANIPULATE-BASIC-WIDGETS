import 'package:flutter/material.dart';
import 'package:testing/Stateful-Widget/W9/model/quiz.dart';
import 'package:testing/Stateful-Widget/W9/ui/screen/resultScreen.dart';
import 'package:testing/Stateful-Widget/W9/ui/widget/choice_card.dart';

class Quizscreen extends StatefulWidget {
  final Quiz quiz;

  const Quizscreen({super.key, required this.quiz});

  @override
  State<Quizscreen> createState() => _QuizscreenState();
}

class _QuizscreenState extends State<Quizscreen> {
  int currentQuestionIndex = 0;

  Question get currentQuestion => widget.quiz.questions[currentQuestionIndex];
  bool get isLastQuestion => currentQuestionIndex == widget.quiz.questions.length - 1;

  void answerQuestion(String selectedChoice) {
    // Record the answer
    widget.quiz.answers.add(
      Answer(answerChoice: selectedChoice, question: currentQuestion),
    );

    if (isLastQuestion) {
      // Go to result screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Resultscreen(quiz: widget.quiz),
        ),
      );
    } else {
      // Move to next question
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Progress indicator
              Text(
                'Question ${currentQuestionIndex + 1} of ${widget.quiz.questions.length}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),

              // Question title
              Text(
                currentQuestion.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              // Answer choices - using reusable ChoiceCard
              Column(
                children: currentQuestion.choice.map((choice) {
                  return ChoiceCard.quiz(
                    text: choice,
                    onTap: () => answerQuestion(choice),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}