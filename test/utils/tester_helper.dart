import 'package:flutter/material.dart';

class TesterHelper {
  Widget buildTestableWidget(Widget widget) {
    return MaterialApp(
      home: Scaffold(
        body: widget,
      ),
    );
  }
}
