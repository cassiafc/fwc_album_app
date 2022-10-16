import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fwc_album_app/app/core/ui/helpers/firebase_errors.dart';
import 'package:fwc_album_app/app/models/register_user_model.dart';
import 'package:fwc_album_app/app/pages/auth/register/presenter/register_presenter.dart';
import 'package:fwc_album_app/app/pages/auth/register/view/register_view.dart';
import 'package:fwc_album_app/app/repository/auth/auth_repository.dart';
import 'package:fwc_album_app/app/repository/user/user_repository.dart';

class RegisterPresenterImpl implements RegisterPresenter {
  final AuthRepository authRepository;
  final UserRepository userRepository;
  late final RegisterView _view;

  RegisterPresenterImpl({required this.authRepository, required this.userRepository});

  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final registerUserModel1 = RegisterUserModel1(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword);

    try {
      UserCredential userCredential = await authRepository.register(registerUserModel1);

      await userRepository.addUser(registerUserModel1, userCredential.user?.uid ?? '');

      _view.registerSuccess();
    } on FirebaseAuthException catch (e) {
      _view.registerError(message: getErrorString(e.code));
    } catch (e, s) {
      log('Error ao cadastrar usuário', error: e, stackTrace: s);
      _view.registerError(message: 'Error ao cadastrar usuário');
    }
  }

  @override
  set view(RegisterView view) => _view = view;
}
