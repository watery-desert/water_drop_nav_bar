import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree
//Copy this CustomPainter code to the Bottom of the File

class WaterDropPainter extends CustomPainter {
  final Color color;

  WaterDropPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final value = 3.743025;
    Path path_0 = Path();
    path_0.moveTo(size.width * (3.743025 - value), 0);
    path_0.cubicTo(
        size.width * (3.982866 - value),
        size.height * 0.06489535,
        size.width * (4.028981 - value),
        size.height * 0.4886860,
        size.width * (4.163185 - value),
        size.height * 0.8271512);
    path_0.cubicTo(
        size.width * (4.210796 - value),
        size.height * 0.9466628,
        size.width * (4.273599 - value),
        size.height * 0.9472209,
        size.width * (4.321369 - value),
        size.height * 0.8285814);
    path_0.cubicTo(
        size.width * (4.461592 - value),
        size.height * 0.4786744,
        size.width * (4.500350 - value),
        size.height * 0.06629070,
        size.width * (4.742707 - value),
        0);
    path_0.lineTo(size.width * (3.743025 - value), 0);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = color;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
