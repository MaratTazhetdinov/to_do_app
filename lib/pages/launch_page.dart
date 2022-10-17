import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_route/auto_route.dart';
import 'package:to_do_app/router/router.gr.dart';
import 'package:to_do_app/theme/app_theme.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3))
        .whenComplete(() => AutoRouter.of(context).push(LoginRoute()));

    return Scaffold(
        backgroundColor: AppTheme.colors.yellow,
        body: Stack(
          children: [
            Center(
              child: Image.asset('assets/rays.png'),
            ),
            Center(
              child: SvgPicture.asset('assets/logo.svg'),
            )
          ],
        ));
  }
}
