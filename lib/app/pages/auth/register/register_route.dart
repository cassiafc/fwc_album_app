import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/pages/auth/register/presenter/register_presenter.dart';
import 'package:fwc_album_app/app/pages/auth/register/presenter/register_presenter_impl.dart';
import 'package:fwc_album_app/app/pages/auth/register/register_page.dart';
import 'package:fwc_album_app/app/repository/user/user_repository.dart';
import 'package:fwc_album_app/app/repository/user/user_repository_impl.dart';

class RegisterRoute extends FlutterGetItPageRoute {

  const RegisterRoute({super.key});


  @override
  List<Bind<Object>> get bindings => [
    Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl(dio: i())),
    Bind.lazySingleton<RegisterPresenter>(
        (i) => RegisterPresenterImpl(authRepository: i(), userRepository: i()),
    )
  ];

  @override
  WidgetBuilder get page => (context) => RegisterPage(presenter: context.get());

}