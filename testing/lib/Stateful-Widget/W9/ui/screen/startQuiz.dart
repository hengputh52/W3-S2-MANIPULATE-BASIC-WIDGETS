import 'package:flutter/material.dart';
import 'package:testing/Stateful-Widget/W9/data/quiz_mock.dart';
import 'package:testing/Stateful-Widget/W9/ui/screen/quizScreen.dart';
import 'package:testing/Stateful-Widget/W9/ui/widget/primary_button.dart';

class Startquiz extends StatelessWidget {
  const Startquiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Quiz logo/image
              Image.asset(
                'images/quiz.png',
              ),

              // Start Button - using reusable PrimaryButton
              PrimaryButton(
                text: 'Start Quiz',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Quizscreen(quiz: createQuiz()),
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
}