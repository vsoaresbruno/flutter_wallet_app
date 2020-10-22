import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wallet_app/colors.dart';

class PieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: customShadow,
            color: primaryColor),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomPaint(
                child: Container(),
                foregroundPainter: PieChartPainter(),
              ),
            ),
            Center(
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: customShadow,
                    color: primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PieChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    double total = 0;
    var startRadian = -pi / 2;
    var paint = new Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 40;

    expenses.forEach((element) {
      total += element['amount'];
    });

    for (int i = 0; i < expenses.length; i++) {
      final currentExpense = expenses[1];
      final sweepRadian = (currentExpense['amount'] / total) * 2 * pi;
      paint.color = pieColors[i];
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
          startRadian, sweepRadian, false, paint);

      startRadian += sweepRadian;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
