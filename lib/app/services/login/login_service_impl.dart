import 'package:firebase_auth/firebase_auth.dart';
import '../../repository/auth/auth_repository.dart';
import 'login_service.dart';

class LoginServiceImpl implements LoginService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final AuthRepository authRepository;

  LoginServiceImpl({required this.authRepository});

  @override
  Future<void> execute(
      {required String email, required String password}) async {
    await authRepository.login(email: email, password: password);
  }
}
