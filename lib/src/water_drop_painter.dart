import 'package:flutter/material.dart';

class WaterDropPainter extends CustomPainter {
  final Color color;

  WaterDropPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    path.cubicTo(
      size.width * 0.239841,
      size.height * 0.06489535,
      size.width * 0.285956,
      size.height * 0.4886860,
      size.width * 0.42016,
      size.height * 0.8271512,
    );
    path.cubicTo(
      size.width * 0.467771,
      size.height * 0.9466628,
      size.width * 0.530574,
      size.height * 0.9472209,
      size.width * 0.578344,
      size.height * 0.8285814,
    );
    path.cubicTo(
        size.width * 0.7185669,
        size.height * 0.4786744,
        size.width * 0.757325,
        size.height * 0.06629070,
        size.width * 0.999682,
        0);
    path.lineTo(0, 0);
    path.close();

    Paint fillColor = Paint()..style = PaintingStyle.fill;

    fillColor.color = color;
    canvas.drawPath(path, fillColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
