import 'package:convention/core/constants/app_consts.dart';
import '../models/login_model.dart';
import '../models/register_model.dart';
import 'dart:async';

class AuthServerManager {
  Future<LoginModel> login(String phoneNumber, String password) async {
    await Future.delayed(const Duration(seconds: 3));

    final storedUser = box.read(phoneNumber);

    if (storedUser != null) {
      if (storedUser['password'] == password) {
        return LoginModel.mock(phoneNumber);
      } else {
        throw "Incorrect password";
      }
    } else {
      throw "User not found";
    }
  }

  Future<RegisterModel> register(String phoneNumber, String name,
      String password, String confirmPassword) async {
    await Future.delayed(const Duration(seconds: 3));

    final existingUser = box.read(phoneNumber);
    if (existingUser != null) {
      throw "Phone number is already registered";
    }

    if (password != confirmPassword) {
      throw "Passwords do not match";
    }

    final userData = {
      "phoneNumber": phoneNumber,
      "name": name,
      "password": password
    };

    box.write(phoneNumber, userData);

    return RegisterModel.mock(phoneNumber, name);
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
