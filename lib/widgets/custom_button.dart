import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String text;
  void Function()? onPressed;
  final Color textColor;
  final Color backgroundColor;

  CustomButton({
    required this.text,
    required this.onPressed,
    this.textColor = const Color(0xFF000000),
    this.backgroundColor = const Color(0xFFFFD60A),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        fixedSize: Size(double.maxFinite, 40),
        primary: backgroundColor,
      ),
    );
  }
}
