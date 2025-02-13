import 'package:convention/core/constants/app_consts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitialAuthState());

  void register(String phoneNumber, String name, String password,
      String confirmPassword) async {
    emit(RegisterLoadingState());
    await Future.delayed(const Duration(seconds: 3));

    if (password != confirmPassword) {
      emit(RegisterErrorState("Passwords do not match"));
      return;
    }

    final existingUser = box.read(phoneNumber);
    if (existingUser != null) {
      emit(RegisterErrorState("Phone number already registered"));
      return;
    }

    Map<String, String> userData = {
      "phoneNumber": phoneNumber,
      "name": name,
      "password": password,
    };
    box.write(phoneNumber, userData);

    emit(RegisterSuccessState());
  }

  void login(String phoneNumber, String password) async {
    emit(LoginLoadingState());
    await Future.delayed(const Duration(seconds: 3));

    final storedUser = box.read(phoneNumber);
    if (storedUser == null) {
      emit(LoginErrorState("User not found"));
      return;
    }

    if (storedUser["password"] != password) {
      emit(LoginErrorState("Incorrect password"));
      return;
    }

    emit(LoginSuccessState(phoneNumber: phoneNumber, name: storedUser["name"]));
  }

  void logout() async {
    emit(LogoutLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(LogoutSuccessState());
  }
}
