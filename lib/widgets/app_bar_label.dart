import 'package:flutter/material.dart';

class AppBarLabel extends StatelessWidget {
  final String text;
  final Color color;

  const AppBarLabel({
    required this.text,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );
  }
}
