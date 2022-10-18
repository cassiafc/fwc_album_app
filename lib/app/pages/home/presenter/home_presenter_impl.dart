import 'package:fwc_album_app/app/pages/home/presenter/home_presenter.dart';
import 'package:fwc_album_app/app/pages/home/view/home_view.dart';
import 'package:fwc_album_app/app/repository/auth/auth_repository.dart';
import 'package:fwc_album_app/app/repository/user/user_repository.dart';

class HomePresenterImpl implements HomePresenter {
  final UserRepository userRepository;
  final AuthRepository authRepository;
  late HomeView _view;

  HomePresenterImpl(
      {required this.userRepository, required this.authRepository});

  @override
  Future<void> getUserData() async {
    try {
      _view.showLoader();
      final user = await userRepository.getMe();
      _view.updateUser(user);
    } catch (e) {
      _view.erro('Erro ao buscar dados do usuário');
    }
  }

  @override
  Future<void> logout() async {
    _view.showLoader();
    await authRepository.logout();
    _view.logoutSuccess();
  }

  @override
  set view(HomeView view) => _view = view;
}
