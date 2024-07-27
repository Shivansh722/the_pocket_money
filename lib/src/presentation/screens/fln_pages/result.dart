import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ResultMeterScreen extends StatelessWidget {
  final String fluencyResult;

  ResultMeterScreen({required this.fluencyResult});

  @override
  Widget build(BuildContext context) {
    double value;
    Color rangeColor;

    switch (fluencyResult) {
      case 'green':
        value = 75;
        rangeColor = Colors.green;
        break;
      case 'yellow':
        value = 50;
        rangeColor = Colors.yellow;
        break;
      case 'red':
        value = 25;
        rangeColor = Colors.red;
        break;
      default:
        value = 0;
        rangeColor = Colors.grey;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Fluency Result'),
      ),
      body: Center(
        child: SfRadialGauge(
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
      ),
    );
  }
}
