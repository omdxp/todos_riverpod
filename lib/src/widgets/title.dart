import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'todo',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Color.fromARGB(38, 47, 47, 247),
          fontSize: 100,
          fontWeight: FontWeight.w100,
          fontFamily: 'Avenir'),
    );
  }
}
