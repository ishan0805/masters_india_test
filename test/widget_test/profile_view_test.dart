// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masters_india_test/src/models/gst_profile.dart';
import 'package:masters_india_test/src/screens/profile_view.dart';

var gstProfile = GstProfile(
    gstin: "23199",
    name: 'ishan',
    address: 'lucknow',
    status: 'active',
    taxpayerType: "reg",
    dataRagistration: "28/02/2021",
    businessType: 'fintech');

Widget GstSearchScreen() =>
    MaterialApp(home: GstProfileView(gst_profile: gstProfile));

void main() {
  group("GstProfile", () {
    testWidgets('GstProfile page showed up ', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(GstSearchScreen());

      // Verify that GstProfile Screen is launching
      expect(find.byType(Scaffold), findsOneWidget);
    });
    testWidgets("Testing overflow of GstProfile page in a mobile screen",
        (tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(500, 800);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(GstSearchScreen());

      // Verify that GstProfile Screen is launching
      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets("Testing overflow of GstProfile Page in a tablet screen",
        (tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1024, 768);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      // Build our app and trigger a frame.
      await tester.pumpWidget(GstSearchScreen());

      // Verify that GstProfile Screen is launching
      expect(find.byType(Scaffold), findsOneWidget);
    });
  });
}
