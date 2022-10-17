import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../states/auth_state.dart';
import 'package:to_do_app/extension/string_extension.dart';

final signUpPageManagerProvider =
    StateNotifierProvider<SignUpPageManager, AuthState>((ref) {
  return SignUpPageManager();
});

class SignUpPageManager extends StateNotifier<AuthState> {
  SignUpPageManager() : super(AuthInitialState());

  String name = '';
  String email = '';
  String password = '';

  void authButtonPressed() {
    if (email.isValidEmail && password.isValidPassword) {
      state = AuthSuccessfulState();
    } else if (!name.isValidName) {
      state = AuthErrorState(errorMessage: 'The name is incorrect');
    } else if (!email.isValidEmail) {
      state = AuthErrorState(errorMessage: 'The email address is incorrect');
    } else if (!password.isValidPassword) {
      state = AuthErrorState(errorMessage: 'The password is incorrect');
    }
  }

  void nameFieldChanged(String name) {
    this.name = name;
    state = this.name.isNotEmpty && email.isNotEmpty && this.password.isNotEmpty
        ? AuthEnabledButtonState()
        : AuthInitialState();
  }

  void emailFieldChanged(String email) {
    this.email = email;
    state = this.name.isNotEmpty && email.isNotEmpty && this.password.isNotEmpty
        ? AuthEnabledButtonState()
        : AuthInitialState();
  }

  void passwordFieldChanged(String password) {
    this.password = password;
    state = this.name.isNotEmpty && email.isNotEmpty && this.password.isNotEmpty
        ? AuthEnabledButtonState()
        : AuthInitialState();
  }

  void reset() {
    this.name = '';
    this.email = '';
    this.password = '';
    state = AuthInitialState();
  }
}
