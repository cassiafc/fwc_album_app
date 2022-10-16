import 'dart:developer';
import 'package:fwc_album_app/app/core/exceptions/unauthorized_exception.dart';
import 'package:fwc_album_app/app/services/login/login_service.dart';
import 'package:fwc_album_app/app/services/login/presenter/login_presenter.dart';
import '../../../pages/auth/login/login_view.dart';

class LoginPresenterImpl implements LoginPresenter {
  final LoginService loginService;
  late final LoginView _view;

  LoginPresenterImpl({
    required this.loginService,
  });

  @override
  Future<void> login(String email, String password) async {
    try {
      await loginService.execute(email: email, password: password);
      _view.success();
    } on UnauthorizeException {
      _view.error('Usuário ou senha inválido');
    } catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);
      _view.error('Erro ao realizar login');
    }
  }

  @override
  set view(LoginView view) => _view = view;
}
