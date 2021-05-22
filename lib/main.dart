import 'package:flutter/material.dart';
import 'package:masters_india_test/src/screens/gst_search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Masters India Test',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: GstSearch(),
    );
  }
}
