import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/custom_alert_dialog.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/app_bar_label.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'sign_in_page_manager.dart';
import '../states/auth_state.dart';

class SignInPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(signInPageManagerProvider);

    if (pageState is AuthSuccessfulState) {
      AutoRouter.of(context).replaceNamed('/main-page');
    }

    ref.listen<AuthState>(signInPageManagerProvider, ((previous, next) {
      if (next is AuthErrorState) {
        showTopSnackBar(
            context, CustomSnackBar.info(message: next.errorMessage));
      }
    }));

    return Scaffold(
        appBar: AppBar(
          title: AppBarLabel(text: 'Sign In'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: AppTheme.colors.black),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 32),
                    CustomTextField(
                        onChanged: ref
                            .read(signInPageManagerProvider.notifier)
                            .emailFieldChanged,
                        label: 'EMAIL'),
                    SizedBox(height: 24),
                    CustomTextField(
                        onChanged: ref
                            .read(signInPageManagerProvider.notifier)
                            .passwordFieldChanged,
                        label: 'PASSWORD',
                        obscureText: true)
                  ],
                )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    pageState is AuthInitialState
                        ? CustomButton(
                            text: 'SIGN IN',
                            onPressed: () {},
                            backgroundColor: AppTheme.colors.grey,
                            textColor: AppTheme.colors.black)
                        : CustomButton(
                            text: 'SIGN IN',
                            onPressed: () {
                              _authButtonPressed(context, ref);
                            }),
                    SizedBox(height: 24)
                  ],
                )
              ],
            ),
          ),
        ));
  }

  void _authButtonPressed(BuildContext context, WidgetRef ref) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog();
        });
    Future.delayed(const Duration(seconds: 3)).whenComplete((() {
      ref.read(signInPageManagerProvider.notifier).authButtonPressed();
      Navigator.of(context).pop();
    }));
  }
}
