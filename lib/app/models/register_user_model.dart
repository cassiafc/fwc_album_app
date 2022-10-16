import 'dart:convert';

class RegisterUserModel1 {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterUserModel1 ({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
});

  Map<String, dynamic> topMap(){
    return {
      'name': name,
      'email': email,
      'password': password,
      'confirm_Password': confirmPassword,
    };
  }

  factory RegisterUserModel1.fromMap(Map<String, dynamic> map) {
    return RegisterUserModel1(
        name: map['nome'] ?? '',
        email: map ['email'] ?? '',
        password: map ['password'] ?? '',
        confirmPassword: map ['confirm_Password'] ?? '',
    );
  }
  String toJson() => json.encode(topMap());

  factory RegisterUserModel1.fromJson(String source) =>
      RegisterUserModel1.fromMap(json.decode(source));


}