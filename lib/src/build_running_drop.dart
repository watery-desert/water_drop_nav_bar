import 'package:flutter/material.dart';

import 'build_falling_drop.dart';

class BuildRunningDrop extends StatelessWidget {
  final AnimationController controller;
  final int selectedIndex;
  final int previousIndex;
  final Color color;
  final int itemCount;
  const BuildRunningDrop({
    Key? key,
    required this.controller,
    required this.selectedIndex,
    required this.previousIndex,
    required this.color,
    required this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double maxElementWidth = deviceWidth / itemCount;
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) => Transform.translate(
        offset: Tween<Offset>(
                begin: Offset(previousIndex * maxElementWidth, 0),
                end: Offset(selectedIndex * maxElementWidth, 0))
            .animate(
              CurvedAnimation(
                parent: controller,
                curve: const Interval(0.0, 0.35),
              ),
            )
            .value,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Opacity(
              opacity: controller.value <= 0.45 ? 1.0 : 0.0,
              child: BuildFallingDrop(
                itemWidth: maxElementWidth,
                color: color,
                width: Tween<double>(begin: 72, end: 56)
                    .animate(
                      CurvedAnimation(
                        parent: controller,
                        curve: const Interval(0.3, 0.45),
                      ),
                    )
                    .value,
                height: Tween<double>(begin: 16, end: 24)
                    .animate(
                      CurvedAnimation(
                        parent: controller,
                        curve: const Interval(0.3, 0.45),
                      ),
                    )
                    .value,
              ),
            ),
            Opacity(
              opacity: controller.value >= 0.45 ? 1.0 : 0.0,
              child: BuildFallingDrop(
                itemWidth: maxElementWidth,
                color: color,
                width: Tween<double>(begin: 56, end: 72)
                    .animate(
                      CurvedAnimation(
                        parent: controller,
                        curve: const Interval(0.45, 0.60),
                      ),
                    )
                    .value,
                height: Tween<double>(begin: 24, end: 16)
                    .animate(
                      CurvedAnimation(
                        parent: controller,
                        curve: const Interval(0.45, 0.60),
                      ),
                    )
                    .value,
              ),
            ),
            Transform.translate(
              offset: Tween<Offset>(
                begin: const Offset(0, 5.0),
                end: const Offset(0, 40),
              )
                  .animate(CurvedAnimation(
                    parent: controller,
                    // 46
                    curve: const Interval(0.40, 0.70),
                  ))
                  .value,
              child: Container(
                width: 10.0,
                height: 10.0,
                decoration: BoxDecoration(
                  color: controller.value > 0.65 ? Colors.transparent : color,
                  // color: Colors.amber,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
