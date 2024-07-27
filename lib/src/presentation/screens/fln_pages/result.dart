import 'dart:math';
import 'package:flutter/material.dart';

class ResultMeterScreen extends StatefulWidget {
  @override
  _ResultMeterScreenState createState() => _ResultMeterScreenState();
}

class _ResultMeterScreenState extends State<ResultMeterScreen> {
  double _result = 0.0;
  Color _meterColor = Colors.green;

  @override
  void initState() {
    super.initState();
    _generateRandomResult();
  }

  void _generateRandomResult() {
    final random = Random();
    setState(() {
      _result = random.nextDouble() * 100; // Random value between 0 and 100
      _meterColor = _getMeterColor(_result);
    });
  }

  Color _getMeterColor(double result) {
    if (result < 33) {
      return Colors.red;
    } else if (result < 66) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Meter'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Result: ${_result.toStringAsFixed(2)}%',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              height: 200,
              child: CustomPaint(
                painter: MeterPainter(_result, _meterColor),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateRandomResult,
              child: Text('Generate New Result'),
            ),
          ],
        ),
      ),
    );
  }
}

class MeterPainter extends CustomPainter {
  final double result;
  final Color color;

  MeterPainter(this.result, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    double angle = (result / 100) * 2 * pi;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      angle,
      true,
      paint,
    );

    paint.color = Colors.grey.shade300;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2 + angle,
      2 * pi - angle,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


