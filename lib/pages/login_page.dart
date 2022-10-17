import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/theme/app_theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_icon_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SvgPicture.asset('assets/logo.svg'),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                        text: 'SIGN IN',
                        onPressed: () {
                          AutoRouter.of(context).pushNamed('/sign-in-page');
                        }),
                    SizedBox(height: 8),
                    CustomButton(
                      text: 'SIGN UP',
                      onPressed: () {
                        // AutoRouter.of(context).pushNamed('/sign-up-page');
                        AutoRouter.of(context).replaceNamed('/main-page');
                      },
                      textColor: AppTheme.colors.white,
                      backgroundColor: AppTheme.colors.darkBlue,
                    ),
                    SizedBox(height: 32),
                    Container(color: AppTheme.colors.separatorColor, height: 1),
                    SizedBox(height: 32),
                    CustomIconButton(
                        text: 'CONTINUE WITH GOOGLE',
                        iconPath: 'assets/google_logo.svg'),
                    SizedBox(height: 8),
                    CustomIconButton(
                        text: 'CONTINUE WITH APPLE',
                        iconPath: 'assets/apple_logo.svg'),
                    SizedBox(height: 8),
                    CustomIconButton(
                        text: 'CONTINUE WITH FACEBOOK',
                        iconPath: 'assets/facebook_logo.svg'),
                    SizedBox(height: 24)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
