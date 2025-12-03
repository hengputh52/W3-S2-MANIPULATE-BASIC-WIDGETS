import 'package:testing/Stateful-Widget/W9/model/quiz.dart';

// Mock data for quiz questions
List<Question> mockQuestions = [
  Question(
    title: 'What is the capital of France?',
    choice: ['London', 'Berlin', 'Paris', 'Madrid'],
    goodChoice: 'Paris',
  ),
  Question(
    title: 'What is 2 + 2?',
    choice: ['3', '4', '5', '6'],
    goodChoice: '4',
  ),
  Question(
    title: 'Which planet is known as the Red Planet?',
    choice: ['Earth', 'Mars', 'Jupiter', 'Venus'],
    goodChoice: 'Mars',
  ),
  Question(
    title: 'What is the largest ocean on Earth?',
    choice: ['Atlantic', 'Indian', 'Arctic', 'Pacific'],
    goodChoice: 'Pacific',
  ),
  Question(
    title: 'Who painted the Mona Lisa?',
    choice: ['Van Gogh', 'Picasso', 'Da Vinci', 'Michelangelo'],
    goodChoice: 'Da Vinci',
  ),
  Question(
    title: 'What programming language is Flutter built with?',
    choice: ['Java', 'Kotlin', 'Dart', 'Swift'],
    goodChoice: 'Dart',
  ),
  Question(
    title: 'How many continents are there?',
    choice: ['5', '6', '7', '8'],
    goodChoice: '7',
  ),
  Question(
    title: 'What is the chemical symbol for water?',
    choice: ['H2O', 'CO2', 'NaCl', 'O2'],
    goodChoice: 'H2O',
  ),
];

// Create a fresh quiz instance
Quiz createQuiz() {
  return Quiz(questions: mockQuestions, answers: []);
}