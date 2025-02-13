abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final String phoneNumber;
  final String name;
  LoginSuccessState({required this.phoneNumber, required this.name});
}

class LoginErrorState extends AuthState {
  final String errorMsg;
  LoginErrorState(this.errorMsg);
}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterErrorState extends AuthState {
  final String errorMsg;
  RegisterErrorState(this.errorMsg);
}

class LogoutLoadingState extends AuthState {}

class LogoutSuccessState extends AuthState {}

class LogoutErrorState extends AuthState {
  final String errorMsg;
  LogoutErrorState(this.errorMsg);
}
