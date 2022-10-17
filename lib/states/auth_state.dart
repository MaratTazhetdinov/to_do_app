abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthEnabledButtonState extends AuthState {}

class AuthSuccessfulState extends AuthState {}

class AuthErrorState extends AuthState {
  final String errorMessage;

  AuthErrorState({required this.errorMessage}) : super();
}
