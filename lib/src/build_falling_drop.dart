import 'package:flutter/material.dart';

import 'water_drop_painter.dart';

class BuildFallingDrop extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double itemWidth;

  const BuildFallingDrop({
    required this.width,
    required this.height,
    required this.color,
    required this.itemWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: itemWidth,
      child: UnconstrainedBox(
        child: SizedBox(
          width: width,
          height: height,
          child: CustomPaint(
            size: Size.zero,
            painter: WaterDropPainter(color),
          ),
        ),
      ),
    );
  }
}
