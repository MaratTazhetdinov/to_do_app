import 'package:flutter/material.dart';
import 'package:to_do_app/theme/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.colors.yellow,
      child: Padding(
        padding: EdgeInsets.only(top: 140, left: 40, bottom: 58),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AvatarIcon(),
                        SizedBox(height: 12),
                        AvatarText(),
                        SizedBox(height: 60),
                        DrawerButton(
                            page: '',
                            iconName: 'productivity_icon.svg',
                            text: 'Productivity'),
                        SizedBox(height: 15),
                        DrawerButton(
                            page: '',
                            iconName: 'projects_icon.svg',
                            text: 'Projects'),
                        SizedBox(height: 15),
                        DrawerButton(
                            page: '',
                            iconName: 'settings_icon.svg',
                            text: 'Settings'),
                      ]),
                )),
            Expanded(
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: DrawerButton(
                      page: '',
                      iconName: 'sign_out_icon.svg',
                      text: 'Sign Out',
                    )))
          ],
        ),
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  final String page;
  final String iconName;
  final String text;

  const DrawerButton(
      {required this.page, required this.iconName, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {},
        icon: SvgPicture.asset('assets/$iconName'),
        label: Text(
          text,
          style: TextStyle(
              color: AppTheme.colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 14),
        ));
  }
}

class AvatarIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      child: Center(
        child: Text('M',
            style: TextStyle(
                color: AppTheme.colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 22)),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppTheme.colors.darkBlue),
    );
  }
}

class AvatarText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Marat\nTazhetdinov',
      style: TextStyle(
          color: AppTheme.colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 22),
    );
  }
}
