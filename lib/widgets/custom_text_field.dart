import 'package:flutter/material.dart';
import 'package:to_do_app/theme/app_theme.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final String label;
  ValueChanged<String>? onChanged;
  final bool obscureText;

  CustomTextField(
      {this.obscureText = false, required this.onChanged, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, bottom: 8),
          child: Text(
            label,
            style: TextStyle(
              color: AppTheme.colors.grey,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(
          height: 40,
          child: Form(
            child: TextFormField(
              onChanged: onChanged,
              cursorColor: AppTheme.colors.white,
              obscureText: obscureText,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: AppTheme.colors.darkBlue,
              ),
              textAlignVertical: TextAlignVertical.top,
              style: TextStyle(
                color: AppTheme.colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
