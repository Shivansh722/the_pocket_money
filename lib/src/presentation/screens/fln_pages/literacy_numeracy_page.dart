import 'package:flutter/material.dart';
import 'package:pocket_money/src/presentation/screens/fln_pages/fln_score_page.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Question> questions = [
    Question(
      text: 'The early bird catches the worm, but the early worm gets eaten. This saying highlights the benefits and risks of being proactive and early. It suggests that while being early can lead to opportunities, it can also expose one to dangers. What is the main idea of the passage?',
      options: [
        'A) Being early is always beneficial',
        'B) Proactivity can lead to opportunities and risks',
        'C) Worms are eaten early in the morning',
        'D) The early bird is the only one who benefits',
      ],
      correctOptionIndex: 1,
    ),
    Question(
      text: 'If she ____ the exam, she will be very happy.',
      options: [
        'A) pass',
        'B) passes',
        'C) passed',
        'D) passing',
      ],
      correctOptionIndex: 1,
    ),
    Question(
      text: 'You have 3 apples and you buy 4 more. How many apples do you have in total?',
      options: [
        'A) 5',
        'B) 6',
        'C) 7',
        'D) 8',
      ],
      correctOptionIndex: 2,
    ),
    Question(
      text: 'A book costs \$15. If you buy 3 books and pay with a \$50 bill, how much change will you receive?',
      options: [
        'A) \$5',
        'B) \$10',
        'C) \$15',
        'D) \$20',
      ],
      correctOptionIndex: 1,
    ),
  ];

  int currentQuestionIndex = 0;
  int score = 0;

  void _nextQuestion(int selectedOptionIndex) {
    if (selectedOptionIndex == questions[currentQuestionIndex].correctOptionIndex) {
      score++;
    }

    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        double quizPercentage = (score / questions.length) * 100;

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScoreScreen(quizPercentage: quizPercentage),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz')),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/sbg.png', // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Question ${currentQuestionIndex + 1}/${questions.length}',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  questions[currentQuestionIndex].text,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ...questions[currentQuestionIndex].options.map((option) {
                  int optionIndex = questions[currentQuestionIndex].options.indexOf(option);
                  return ListTile(
                    title: Text(option),
                    leading: Radio(
                      value: optionIndex,
                      groupValue: null,
                      onChanged: (value) {
                        _nextQuestion(value as int);
                      },
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Question {
  final String text;
  final List<String> options;
  final int correctOptionIndex;

  Question({required this.text, required this.options, required this.correctOptionIndex});
}
