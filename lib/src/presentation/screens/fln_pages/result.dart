import 'package:flutter/material.dart';
import 'package:pocket_money/src/presentation/screens/fln_pages/literacy_numeracy_page.dart';
import 'package:pocket_money/src/presentation/variables/fluency_var.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ResultMeterScreen extends StatelessWidget {
  final String fluencyResult;

  ResultMeterScreen({required this.fluencyResult});

  @override
  Widget build(BuildContext context) {
    double value;
    Color rangeColor;
    String percentageText;

    switch (fluencyResult) {
      case 'green':
        value = 75;
        rangeColor = Colors.green;
        percentageText = '75%';
        break;
      case 'yellow':
        value = 50;
        rangeColor = Colors.yellow;
        percentageText = '50%';
        break;
      case 'red':
        value = 25;
        rangeColor = Colors.red;
        percentageText = '25%';
        break;
      default:
        value = 0;
        rangeColor = Colors.grey;
        percentageText = '0%';
    }

    globalFluencyPercentage = value;

    return Scaffold(
      appBar: AppBar(
        title: Text('Fluency Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  ranges: <GaugeRange>[
                    GaugeRange(startValue: 0, endValue: 33, color: Colors.red, label: 'Low', sizeUnit: GaugeSizeUnit.factor, startWidth: 0.1, endWidth: 0.1),
                    GaugeRange(startValue: 33, endValue: 66, color: Colors.yellow, label: 'Medium', sizeUnit: GaugeSizeUnit.factor, startWidth: 0.1, endWidth: 0.1),
                    GaugeRange(startValue: 66, endValue: 100, color: Colors.green, label: 'High', sizeUnit: GaugeSizeUnit.factor, startWidth: 0.1, endWidth: 0.1),
                  ],
                  pointers: <GaugePointer>[
                    NeedlePointer(
                      value: value,
                      enableAnimation: true,
                    )
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      widget: Container(
                        child: Text(
                          fluencyResult,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: rangeColor,
                          ),
                        ),
                      ),
                      angle: 90,
                      positionFactor: 0.5,
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 20), // Add space between gauge and text
            Text(
              percentageText,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: rangeColor,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.green,
                  fixedSize: Size(MediaQuery.sizeOf(context).width/1.1,25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen()));
                },
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
