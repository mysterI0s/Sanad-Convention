class RegisterModel {
  final String message;
  final User user;

  RegisterModel({
    required this.message,
    required this.user,
  });

  factory RegisterModel.mock(String email, String name) {
    return RegisterModel(
      message: "Registration successful",
      user: User.mock(email, name),
    );
  }
}

class User {
  final String name;
  final String email;

  User({
    required this.name,
    required this.email,
  });

  factory User.mock(String email, String name) {
    return User(
      name: name,
      email: email,
    );
  }
}
