import 'package:flutter/material.dart';

class IconClipper extends CustomClipper<Rect> {
  final double radius;

  IconClipper({required this.radius});

  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: radius,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
