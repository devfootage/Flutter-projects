import 'package:flutter/material.dart';

import './intropage widgets/homescreen.dart';

void main(List<String> args) {
  runApp(Quiz());
}

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Color.fromRGBO(112, 213, 21, 1),
          ),
          bodySmall: TextStyle(
            color: Color.fromRGBO(12, 3, 30, 1),
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: HomeBackground(),
      ),
    );
  }
}
