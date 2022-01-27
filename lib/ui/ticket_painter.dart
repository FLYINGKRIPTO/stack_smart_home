import 'package:flutter/material.dart';
import 'dart:math';

import 'package:stack_smart_home/utils/color.dart';

class TickPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double scaleFactor = size.shortestSide / 180;

    double r = size.shortestSide / 2;
    double tick = 5 * scaleFactor,
        longTick = 2.0 * tick;
    double p = longTick + 4 * scaleFactor;
    Paint tickPaint = Paint()
      ..color = BrandColor.grey.halfOpacity
      ..strokeWidth = 2.0 * scaleFactor;

    for (int i = 15; i <= 45; i++) {
      double len = tick;
      if (i % 30 == 0) {
        len = longTick;
      }
      double angleFrom12 = i / 60.0 * 2.0 * pi;
      double angleFrom3 = pi / 2.0 - angleFrom12;

      canvas.drawLine(
          size.center(
            Offset(
              cos(angleFrom3) * (r + len - p),
              sin(angleFrom3) * (r + len - p),
            ),
          ),
          size.center(
            Offset(
              cos(angleFrom3) * (r - p),
              sin(angleFrom3) * (r - p),
            ),
          ),
          tickPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
