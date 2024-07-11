// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

OnButtonPressCallback onItemSelected = (_) {};

void main() {
  testWidgets(
    'expecting default values',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: WaterDropNavBar(barItems: <BarItem>[
              BarItem(
                filledIcon: const Icon(Icons.home_filled),
                outlinedIcon: const Icon(Icons.home_outlined),
              ),
              BarItem(
                filledIcon: const Icon(Icons.bookmark_rounded),
                outlinedIcon: const Icon(Icons.bookmark_outline_rounded),
              )
            ], selectedIndex: 0, onItemSelected: onItemSelected),
          ),
        ),
      );
      expect(
        tester.widget<WaterDropNavBar>(find.byType(WaterDropNavBar)).iconSize,
        28.0,
      );
      expect(
        tester.widget<WaterDropNavBar>(find.byType(WaterDropNavBar)).backgroundColor,
        Colors.white,
      );
      expect(
        tester.widget<WaterDropNavBar>(find.byType(WaterDropNavBar)).waterDropColor,
        const Color(0xFF5B75F0),
      );
    },
  );

  testWidgets(
    'throws assertion error if items are less than two or greater than four',
    (WidgetTester tester) async {
      /// base widget
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
        await tester.pumpWidget(
          boilerplate(
            <BarItem>[
              BarItem(
                filledIcon: const Icon(Icons.bookmark_rounded),
                outlinedIcon: Icon(Icons.bookmark_border_rounded),
              ),
            ],
          ),
        );
      }, throwsAssertionError);

      // More than four items, throw exception
      expect(
        () async {
          await tester.pumpWidget(
            boilerplate(
              <BarItem>[
                BarItem(
                  filledIcon: const Icon(Icons.bookmark_rounded),
                  outlinedIcon: const Icon(Icons.bookmark_border_rounded),
                ),
                BarItem(
                  filledIcon: const Icon(Icons.favorite_rounded),
                  outlinedIcon: const Icon(Icons.favorite_border_rounded),
                ),
                BarItem(
                  filledIcon: const Icon(Icons.email_rounded),
                  outlinedIcon: const Icon(Icons.email_outlined),
                ),
                BarItem(
                  filledIcon: const Icon(Icons.folder_rounded),
                  outlinedIcon: const Icon(Icons.folder_outlined),
                ),
                BarItem(
                  filledIcon: const Icon(Icons.home_filled),
                  outlinedIcon: const Icon(Icons.home_outlined),
                ),
              ],
            ),
          );
        },
        throwsAssertionError,
      );
    },
  );
}
