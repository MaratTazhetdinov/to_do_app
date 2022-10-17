import 'package:flutter/material.dart';
import 'package:to_do_app/theme/app_theme.dart';
import 'router/router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // runApp(const MyApp());
  runApp(const ProviderScope(child: MyApp()));
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        theme: AppTheme.define(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate());
  }
}
