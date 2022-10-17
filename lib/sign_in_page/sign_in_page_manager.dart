import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../states/auth_state.dart';
import 'package:to_do_app/extension/string_extension.dart';

final signInPageManagerProvider =
    StateNotifierProvider.autoDispose<SignInPageManager, AuthState>((ref) {
  return SignInPageManager();
});

class SignInPageManager extends StateNotifier<AuthState> {
  SignInPageManager() : super(AuthInitialState());

  String email = '';
  String password = '';

  void authButtonPressed() {
    if (email.isValidEmail && password.isValidPassword) {
      state = AuthSuccessfulState();
    } else if (!email.isValidEmail) {
      state = AuthErrorState(errorMessage: 'The email address is incorrect');
    } else if (!password.isValidPassword) {
      state = AuthErrorState(errorMessage: 'The password is incorrect');
    }
  }

  void emailFieldChanged(String email) {
    this.email = email;
    state = this.email.isNotEmpty && this.password.isNotEmpty
        ? AuthEnabledButtonState()
        : AuthInitialState();
  }

  void passwordFieldChanged(String password) {
    this.password = password;
    state = this.email.isNotEmpty && this.password.isNotEmpty
        ? AuthEnabledButtonState()
        : AuthInitialState();
  }
}
