import 'dart:convert';

class RegisterUserModel1 {
  final String uid;
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterUserModel1({
    required this.uid,
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> topMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'confirm_Password': confirmPassword,
    };
  }

  Map<String, dynamic> topMapSave() {
    return {
      "name": name,
      "email": email,
      "created_at": DateTime.now(),
      "updated_at": DateTime.now(),
      "total_album": 634,
      "total_stickers": 0,
      "total_duplicates": 0,
      "total_complete": 634,
      "total_complete_percent": 0
    };
  }

  factory RegisterUserModel1.fromMap(Map<String, dynamic> map) {
    return RegisterUserModel1(
      uid: map['uid'] ?? '',
      name: map['nome'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      confirmPassword: map['confirm_Password'] ?? '',
    );
  }

  String toJson() => json.encode(topMap());

  factory RegisterUserModel1.fromJson(String source) =>
      RegisterUserModel1.fromMap(json.decode(source));
}
