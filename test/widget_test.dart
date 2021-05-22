// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:ui' as ui show Paint, Path, Canvas;
import 'package:masters_india_test/src/screens/gst_search.dart';

Widget GstSearchScreen() => MaterialApp(home: GstSearch());

void main() {
  group("GstSearch", () {
    testWidgets('GstSearch page showed up ', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(GstSearchScreen());

      // Verify that GstSearch Screen is launching
      expect(find.byType(Scaffold), findsOneWidget);
    });
    testWidgets("Testing overflow of events page in a mobile screen",
        (tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(480, 800);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(GstSearchScreen());

      // Verify that GstSearch Screen is launching
      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets("Testing overflow of events Page in a tablet screen",
        (tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1024, 768);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      // Build our app and trigger a frame.
      await tester.pumpWidget(GstSearchScreen());

      // Verify that GstSearch Screen is launching
      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets(
        "Testing if GstSearch page shows up validations on empty submission",
        (tester) async {
      await tester.pumpWidget(GstSearchScreen());
      final Finder formWidgetFinder = find.byType(Form);
      final Form formWidget = tester.widget(formWidgetFinder) as Form;
      final GlobalKey<FormState> formKey =
          formWidget.key as GlobalKey<FormState>;
      expect(formKey.currentState.validate(), isFalse);
    });
    testWidgets(
        "Testing if GstSearch page shows up validations on submission on fields with data",
        (tester) async {
      await tester.pumpWidget(GstSearchScreen());
      final Finder gstin = find.byType(TextFormField);
      await tester.enterText(gstin, "01454d8ishan");

      await tester.pump();
      final Finder formWidgetFinder = find.byType(Form);
      final Form formWidget = tester.widget(formWidgetFinder) as Form;
      final GlobalKey<FormState> formKey =
          formWidget.key as GlobalKey<FormState>;
      expect(formKey.currentState.validate(), isTrue);
    });
  });
}
