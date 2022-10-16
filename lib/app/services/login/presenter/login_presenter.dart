import 'package:fwc_album_app/app/core/mvp/fwc_presenter.dart';
import '../../../pages/auth/login/login_view.dart';

abstract class LoginPresenter extends FwcPresenter<LoginView> {
  Future<void> login(String email, String password);
}