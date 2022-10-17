import 'package:auto_route/auto_route.dart';
import 'package:to_do_app/todo_page/to_do_page.dart';
import '../pages/launch_page.dart';
import '../pages/login_page.dart';
import '../sign_in_page/sign_in_page.dart';
import '../sign_up_page/sign_up_page.dart';
import '../main_page/main_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LaunchPage, initial: true),
    AutoRoute(page: LoginPage),
    AutoRoute(page: SignInPage),
    AutoRoute(page: SignUpPage),
    AutoRoute(page: MainPage),
    AutoRoute(page: TodoPage)
  ],
)
class $AppRouter {}
