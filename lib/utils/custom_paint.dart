import 'package:flutter/material.dart';
import 'package:wave_dispatch/utils/constants.dart';

class VerticalDottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = primaryColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    final double dotSpacing = 5.0; // Adjust the spacing between dots

    for (double y = 0; y < size.height; y += dotSpacing * 2) {
      canvas.drawLine(
        Offset(size.width / 2, y),
        Offset(size.width / 2, y + dotSpacing),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
