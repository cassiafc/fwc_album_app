import 'package:firebase_auth/firebase_auth.dart';

import '../../core/rest/custom_dio.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CustomDio dio;

  AuthRepositoryImpl({required this.dio});

  @override
  Future<UserCredential> login(
      {required String email, required String password}) async {
    return await auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> logout() async {
    await auth.signOut();
  }

  @override
  Future<UserCredential> register(
      {required String email, required String password}) async {
    return await auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
