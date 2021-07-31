// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:water_drop_nav_bar/src/build_nav_bar.dart';

import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

OnButtonPressCallback onItemSelected = (int index) {};

void main() {
  testWidgets('expecting default values', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: WaterDropNavBar(barItems: [
            BarItem(
                filledIcon: Icons.home_filled,
                outlinedIcon: Icons.home_outlined),
            BarItem(
                filledIcon: Icons.bookmark_rounded,
                outlinedIcon: Icons.bookmark_outline_rounded)
          ], selectedIndex: 0, onItemSelected: onItemSelected),
        ),
      ),
    );
    expect(
      tester.widget<WaterDropNavBar>(find.byType(WaterDropNavBar)).iconSize,
      28.0,
    );
    expect(
      tester
          .widget<WaterDropNavBar>(find.byType(WaterDropNavBar))
          .backgroundColor,
      Colors.white,
    );
    expect(
      tester
          .widget<WaterDropNavBar>(find.byType(WaterDropNavBar))
          .waterDropColor,
      Color(0xFF5B75F0),
    );
  });

  testWidgets(
      'throws assertion error if items are less than two or greater than four',
      (WidgetTester tester) async {
    Widget boilerplate(List<BarItem> items) {
      return MaterialApp(
        home: Material(
          child: WaterDropNavBar(
            selectedIndex: 0,
            onItemSelected: onItemSelected,
            barItems: items,
          ),
        ),
      );
    }

    // Less than two items, throw exception
    expect(() async {
      await tester.pumpWidget(boilerplate(<BarItem>[
        BarItem(
          filledIcon: Icons.bookmark_rounded,
          outlinedIcon: Icons.bookmark_border_rounded,
        ),
      ]));
    }, throwsAssertionError);

    // More than four items, throw exception
    expect(() async {
      await tester.pumpWidget(boilerplate(<BarItem>[
        BarItem(
          filledIcon: Icons.bookmark_rounded,
          outlinedIcon: Icons.bookmark_border_rounded,
        ),
        BarItem(
            filledIcon: Icons.favorite_rounded,
            outlinedIcon: Icons.favorite_border_rounded),
        BarItem(
          filledIcon: Icons.email_rounded,
          outlinedIcon: Icons.email_outlined,
        ),
        BarItem(
          filledIcon: Icons.folder_rounded,
          outlinedIcon: Icons.folder_outlined,
        ),
        BarItem(
          filledIcon: Icons.home_filled,
          outlinedIcon: Icons.home_outlined,
        ),
      ]));
    }, throwsAssertionError);
  });
}
