import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DottedLinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  

  DottedLinePainter(
      {required this.color,
      required this.strokeWidth,
      });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    const dashWidth = 2;
    const dashSpace = 3;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
