import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CustomAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      contentPadding: EdgeInsets.all(0),
      content: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppTheme.colors.backgroundColor),
        height: 150,
        child: Center(
            child: CircularProgressIndicator(
          color: AppTheme.colors.yellow,
        )),
      ),
    );
  }
}
