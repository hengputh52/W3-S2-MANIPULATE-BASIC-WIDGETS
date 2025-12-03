import 'package:flutter/material.dart';
import 'package:testing/Stateful-Widget/W9/model/quiz.dart';
import 'package:testing/Stateful-Widget/W9/ui/screen/startQuiz.dart';
import 'package:testing/Stateful-Widget/W9/ui/widget/choice_card.dart';
import 'package:testing/Stateful-Widget/W9/ui/widget/primary_button.dart';
import 'package:testing/Stateful-Widget/W9/ui/widget/question_header.dart';
import 'package:testing/Stateful-Widget/W9/ui/widget/score_circle.dart';

class Resultscreen extends StatelessWidget {
  final Quiz quiz;

  const Resultscreen({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    final int score = quiz.getScore();
    final int totalQuestions = quiz.questions.length;

    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Score Header
              const SizedBox(height: 20),
              Column(
                children: [
                  Text(
                    'You answered $score out of $totalQuestions!',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Score Circle - using reusable ScoreCircle
                  ScoreCircle(
                    text: '$score',
                    backgroundColor: score >= totalQuestions / 2
                        ? Colors.green
                        : Colors.red,
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Questions Results Section
              Expanded(
                child: ListView.builder(
                  itemCount: quiz.answers.length,
                  itemBuilder: (context, index) {
                    final answer = quiz.answers[index];
                    final question = answer.question;
                    final isCorrect = answer.isCorrect();

                    return _buildQuestionResult(
                      questionNumber: index + 1,
                      question: question,
                      userAnswer: answer.answerChoice,
                      isCorrect: isCorrect,
                    );
                  },
                ),
              ),

              // Restart Quiz Button - using reusable PrimaryButton
              PrimaryButton(
                text: 'Restart Quiz',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Startquiz(),
                    ),
                    
                  );
                },
                
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionResult({
    required int questionNumber,
    required Question question,
    required String userAnswer,
    required bool isCorrect,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question Header - using reusable QuestionHeader
          QuestionHeader.result(
            questionNumber: questionNumber,
            questionText: question.title,
            isCorrect: isCorrect,
          ),

          const SizedBox(height: 10),

          // Options - using reusable ChoiceCard
          ...question.choice.map((choice) {
            final isUserAnswer = choice == userAnswer;
            final isCorrectAnswer = choice == question.goodChoice;

            return ChoiceCard.result(
              text: choice,
              isUserAnswer: isUserAnswer,
              isCorrectAnswer: isCorrectAnswer,
            );
          }),
        ],
      ),
    );
  }
}