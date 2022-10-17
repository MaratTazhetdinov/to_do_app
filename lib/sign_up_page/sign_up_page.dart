import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/sign_up_page/sign_up_page_manager.dart';
import 'package:to_do_app/widgets/custom_text_field.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../states/auth_state.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_alert_dialog.dart';
import '../widgets/custom_button.dart';
import '../widgets/app_bar_label.dart';
import 'package:auto_route/auto_route.dart';

class SignUpPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(signUpPageManagerProvider);

    if (pageState is AuthSuccessfulState) {
      AutoRouter.of(context).pushNamed('/main-page');
    }

    ref.listen<AuthState>(signUpPageManagerProvider, ((previous, next) {
      if (next is AuthErrorState) {
        showTopSnackBar(
            context, CustomSnackBar.info(message: next.errorMessage));
      }
    }));

    return Scaffold(
        appBar: AppBar(
          title: AppBarLabel(text: 'Sign Up'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              ref.read(signUpPageManagerProvider.notifier).reset();
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black),
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
                            .read(signUpPageManagerProvider.notifier)
                            .nameFieldChanged,
                        label: 'NAME'),
                    SizedBox(height: 24),
                    CustomTextField(
                        onChanged: ref
                            .read(signUpPageManagerProvider.notifier)
                            .emailFieldChanged,
                        label: 'EMAIL'),
                    SizedBox(height: 24),
                    CustomTextField(
                        onChanged: ref
                            .read(signUpPageManagerProvider.notifier)
                            .passwordFieldChanged,
                        label: 'PASSWORD'),
                  ],
                )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    pageState is AuthInitialState
                        ? CustomButton(
                            text: 'SIGN UP',
                            onPressed: () {},
                            backgroundColor: AppTheme.colors.grey,
                            textColor: AppTheme.colors.black)
                        : CustomButton(
                            text: 'SIGN UP',
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
      ref.read(signUpPageManagerProvider.notifier).authButtonPressed();
      Navigator.of(context).pop();
    }));
  }
}
