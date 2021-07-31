library water_drop_nav_bar;

import 'package:flutter/material.dart';
import 'src/bar_item.dart';

import 'src/build_nav_bar.dart';
export 'src/bar_item.dart';

class WaterDropNavBar extends StatelessWidget {
  /// Background Color of the bar.
  final Color backgroundColor;

  /// Callback When individual barItem is pressed.
  final OnButtonPressCallback onItemSelected;

  /// Current selected index of the bar item.
  final int selectedIndex;

  /// List of bar items that shows horizontally, Minimum 2 and maximum 4 items.
  final List<BarItem> barItems;

  /// Color of water drop which is also the active icon color.
  final Color waterDropColor;

  /// Inactive icon color by default it will use water drop color.
  final Color inactiveIconColor;

  /// Each active & inactive icon size, default value is 30 don't make it too big or small.
  final double iconSize;

  /// Bottom padding of the bar. If nothing is provided the it will use
  /// [MediaQuery.of(context).padding.bottom] value.
  final double? bottomPadding;

  const WaterDropNavBar({
    required this.barItems,
    required this.selectedIndex,
    required this.onItemSelected,
    this.bottomPadding,
    this.backgroundColor = Colors.white,
    this.waterDropColor = const Color(0xFF5B75F0),
    this.iconSize = 28,
    Color? inactiveIconColor,
    Key? key,
  })  : inactiveIconColor = inactiveIconColor ?? waterDropColor,
        assert(barItems.length > 1, 'You must provide minimum 2 bar items'),
        assert(barItems.length < 5, 'Maximum bar items count is 4'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildNavBar(
      itmes: barItems,
      backgroundColor: backgroundColor,
      selectedIndex: selectedIndex,
      onItemSelected: onItemSelected,
      dropColor: waterDropColor,
      iconSize: iconSize,
      inactiveIconColor: inactiveIconColor,
      bottomPadding: bottomPadding,
    );
  }
}
