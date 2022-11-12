import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

// ignore: must_be_immutable
class CustomHeader extends StatelessWidget {
  String label;

  CustomHeader({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Text(
        label,
        style: TextStyle(
          color: AppTheme.colors.grey,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }
}
