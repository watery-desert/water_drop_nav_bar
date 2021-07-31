import 'package:flutter/material.dart';

import 'bar_item.dart';
import 'build_icon_button.dart';
import 'build_running_drop.dart';

typedef OnButtonPressCallback = void Function(int index);

class BuildNavBar extends StatefulWidget {
  final int selectedIndex;
  final List<BarItem> itmes;
  final Color backgroundColor;
  final OnButtonPressCallback onItemSelected;
  final Color dropColor;
  final double iconSize;
  final Color inactiveIconColor;
  final double? bottomPadding;

  const BuildNavBar({
    Key? key,
    required this.itmes,
    required this.backgroundColor,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.dropColor,
    required this.iconSize,
    required this.inactiveIconColor,
    required this.bottomPadding,
  }) : super(key: key);

  @override
  _BuildNavBarState createState() => _BuildNavBarState();
}

class _BuildNavBarState extends State<BuildNavBar>
    with TickerProviderStateMixin {
  int _previousIndex = 0;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      //milliseconds: 800
      duration: const Duration(milliseconds: 800),
    )..forward(from: 0.0);
  }

  void _onTap(int index) {
    final selectedIndex = widget.selectedIndex;

    if (selectedIndex == index || _controller.isAnimating) {
      return;
    } else {
      widget.onItemSelected(index);
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
    final bottomPadding =
        widget.bottomPadding ?? MediaQuery.of(context).padding.bottom;
    final barHeight = 60 + bottomPadding;
    return Container(
      height: barHeight,
      color: backgroundColor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (_, __) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: items.map(
                  (barItem) {
                    final index = items.indexOf(barItem);
                    return BuildIconButton(
                      bottomPadding: bottomPadding,
                      barHeight: barHeight,
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
