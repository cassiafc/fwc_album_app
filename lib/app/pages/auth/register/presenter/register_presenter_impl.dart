import 'dart:developer';

import 'package:fwc_album_app/app/models/register_user_model.dart';
import 'package:fwc_album_app/app/pages/auth/register/presenter/register_presenter.dart';
import 'package:fwc_album_app/app/pages/auth/register/view/register_view.dart';
import 'package:fwc_album_app/app/repository/auth/auth_repository.dart';

class RegisterPresenterImpl implements RegisterPresenter {
  final AuthRepository authRepository;
 late final RegisterView _view;

 RegisterPresenterImpl({required this.authRepository});

  @override
  Future<void> register(
      { required String name,
        required String email,
        required String password,
        required String confirmPassword,
      }) async {
    final registerUserModel1 = RegisterUserModel1(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword
    );
   try {
     await authRepository.register(registerUserModel1);
     _view.registerSuccess();
   } catch (e, s) {
     log('Error ao cadastrar usuário', error: e, stackTrace: s);
     _view.registerError();
   }
  }

  @override
  set view(RegisterView view) => _view = view;
  
}