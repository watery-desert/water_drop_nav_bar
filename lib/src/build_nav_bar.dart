import 'package:flutter/material.dart';

import 'bar_item.dart';
import 'build_icon_button.dart';
import 'build_running_drop.dart';

typedef OnButtonPressCallback = void Function(int index);

class BuildNavBar extends StatefulWidget {
  final int selectedIndex;
  final List<BarItem> itmes;
  final Color backgroundColor;
  final OnButtonPressCallback onButtonPressed;
  final Color dropColor;
  final double iconSize;
  final Color inactiveIconColor;

  const BuildNavBar({
    Key? key,
    required this.itmes,
    required this.backgroundColor,
    required this.selectedIndex,
    required this.onButtonPressed,
    required this.dropColor,
    required this.iconSize,
    required this.inactiveIconColor,
  }) : super(key: key);

  @override
  _BuildNavBarState createState() => _BuildNavBarState();
}

class _BuildNavBarState extends State<BuildNavBar>
    with TickerProviderStateMixin {
  // int selectedIndex = 0;
  int _previousIndex = 0;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward(from: 0.0);
  }

  void _onTap(int index) {
    final selectedIndex = widget.selectedIndex;

    if (selectedIndex == index || _controller.isAnimating) {
      return;
    } else {
      widget.onButtonPressed(index);
      _controller.forward(from: 0.0);
      _controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _previousIndex = index;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = widget.selectedIndex;
    final backgroundColor = widget.backgroundColor;
    final dropColor = widget.dropColor;
    final items = widget.itmes;
    final iconSize = widget.iconSize;
    final inactiveIconColor = widget.inactiveIconColor;
    return Container(
      height: 100,
      color: backgroundColor,
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (_, __) => Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: items.map(
                  (barItem) {
                    final index = items.indexOf(barItem);
                    return BuildIconButton(
                      barColor: backgroundColor,
                      inactiveColor: inactiveIconColor,
                      color: dropColor,
                      index: index,
                      iconSize: iconSize,
                      seletedIndex: selectedIndex.toInt(),
                      controller: _controller,
                      selectedIcon: barItem.filledIcon,
                      unslectedIcon: barItem.outlinedIcon,
                      onPressed: () => _onTap(index),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
          BuildRunningDrop(
            itemCount: items.length,
            controller: _controller,
            selectedIndex: selectedIndex,
            previousIndex: _previousIndex,
            color: dropColor,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
