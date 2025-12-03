class Question
{
  final String title;
  final List<String> choice;
  final String goodChoice;

  Question({required this.title, required this.choice, required this.goodChoice});
  
}

class Answer
{
  final String answerChoice;
  Question question;

  Answer({required this.answerChoice, required this.question});

  bool isCorrect() => answerChoice == question.goodChoice;
  
}

class Quiz
{
  List<Question> questions;
  List<Answer> answers;

  Quiz({required this.questions, required this.answers});

  int getScore()
  {
    int totalScore = 0;
    for(Answer a in answers)
    {
      if(a.isCorrect())
      {
        totalScore++;
      }
    }
    return totalScore;
  }
}