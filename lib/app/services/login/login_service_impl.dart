import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../repository/auth/auth_repository.dart';
import 'login_service.dart';

class LoginServiceImpl implements LoginService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final AuthRepository authRepository;

  LoginServiceImpl({required this.authRepository});

  @override
  Future<void> execute(
      {required String email, required String password}) async {

    await auth.signInWithEmailAndPassword(email: email, password: password);

    // final accessToken =
    //     await authRepository.login(email: email, password: password);
    // final sp = await SharedPreferences.getInstance();
    // sp.setString('accessToken', accessToken);
  }
}
