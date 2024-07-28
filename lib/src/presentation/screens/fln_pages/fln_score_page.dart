import 'package:flutter/material.dart';
import 'package:pocket_money/src/presentation/variables/fluency_var.dart';

class ScoreScreen extends StatelessWidget {
  final double quizPercentage;

  const ScoreScreen({
    Key? key,
    required this.quizPercentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double averagePercentage = (globalFluencyPercentage + quizPercentage) / 2;

    return Scaffold(
      appBar: AppBar(
        title: Text('Score'),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/sbg.png', // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          // Content
          Center(
            child: Card(
              color: Colors.white.withOpacity(0.8), // Semi-transparent card
              margin: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Fluency Percentage: ${globalFluencyPercentage.toStringAsFixed(2)}%',
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Quiz Percentage: ${quizPercentage.toStringAsFixed(2)}%',
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'FLN Score: ${averagePercentage.toStringAsFixed(2)}%',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
