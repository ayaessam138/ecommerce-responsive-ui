class LoginParam {
  final String email;
  final String password;

  LoginParam({required this.email, required this.password});

  // ✅ toJson
  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
