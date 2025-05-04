import 'package:flutter/material.dart';

class BarItem {
  /// Selected or active icon must be filled icon and complementary to inactive icon.
  final Widget filledIcon;

  /// Normal or inactive icon must be outlined icon and complementary to active icon.
  final Widget outlinedIcon;
  BarItem({
    required this.filledIcon,
    required this.outlinedIcon,
  });
}
