import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/theme/app_theme.dart';

class CustomIconButton extends StatelessWidget {
  final String text;
  final String iconPath;

  const CustomIconButton({required this.text, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: SvgPicture.asset(iconPath),
      label: Text(
        text,
        style: TextStyle(
          color: AppTheme.colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        fixedSize: Size(double.maxFinite, 40),
        primary: AppTheme.colors.darkBlue,
      ),
    );
  }
}
