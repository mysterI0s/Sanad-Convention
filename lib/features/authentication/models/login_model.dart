class LoginModel {
  final String message;
  final String accessToken;
  final String tokenType;

  LoginModel({
    required this.message,
    required this.accessToken,
    required this.tokenType,
  });

  factory LoginModel.mock(String email) {
    return LoginModel(
      message: "Login successful",
      accessToken: "mock_token_123",
      tokenType: "Bearer",
    );
  }
}
