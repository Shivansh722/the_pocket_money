import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    color: Colors.white.withOpacity(0.8), // Semi-transparent card
                    margin: const EdgeInsets.all(16.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Fluency Percentage: ${globalFluencyPercentage.toStringAsFixed(2)}%',
                            style: const TextStyle(fontSize: 22),
                          ),
                         const SizedBox(height: 8),
                          Text(
                            'Quiz Percentage: ${quizPercentage.toStringAsFixed(2)}%',
                            style: const TextStyle(fontSize: 22),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'FLN Score: ${averagePercentage.toStringAsFixed(2)}%',
                            style:const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.popUntil(context, (route) => route.isFirst);
                            },
                            child:const Text(
                              'Back to Home',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                 const SizedBox(height: 16),
                  // Graph
                  Card(
                    color: Colors.white.withOpacity(0.8),
                    margin: const EdgeInsets.all(16.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SfRadialGauge(
                        axes: <RadialAxis>[
                          RadialAxis(
                            minimum: 0,
                            maximum: 100,
                            ranges: <GaugeRange>[
                              GaugeRange(
                                startValue: 0,
                                endValue: globalFluencyPercentage,
                                color: Colors.blue,
                                label: 'Fluency',
                                sizeUnit: GaugeSizeUnit.factor,
                                labelStyle: GaugeTextStyle(fontSize: 12, color: Colors.blue),
                              ),
                              GaugeRange(
                                startValue: globalFluencyPercentage,
                                endValue: quizPercentage,
                                color: Colors.green,
                                label: 'Quiz',
                                sizeUnit: GaugeSizeUnit.factor,
                                labelStyle: const GaugeTextStyle(fontSize: 12, color: Colors.green),
                              ),
                            ],
                            pointers: <GaugePointer>[
                              NeedlePointer(
                                value: globalFluencyPercentage,
                                needleColor: Colors.blue,
                                needleEndWidth: 4,
                                knobStyle: const KnobStyle(color: Colors.blue, borderColor: Colors.blue),
                              ),
                              NeedlePointer(
                                value: quizPercentage,
                                needleColor: Colors.green,
                                needleEndWidth: 4,
                                knobStyle: KnobStyle(color: Colors.green, borderColor: Colors.green),
                              ),
                            ],
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(
                                widget: Text(
                                  'Fluency: ${globalFluencyPercentage.toStringAsFixed(2)}%\nQuiz: ${quizPercentage.toStringAsFixed(2)}%',
                                  style:const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                positionFactor: 0.5,
                                angle: 90,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
