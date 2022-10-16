
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fwc_album_app/app/pages/splash/presenter/presenter/splash_presenter.dart';
import 'package:fwc_album_app/app/pages/splash/view/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPresenterImpl implements SplashPresenter {

  final FirebaseAuth auth = FirebaseAuth.instance;
  late final SplashView _view;

  @override
  Future<void> checkLogin() async{
    _view.showLoader();

    final User? currentUser = auth.currentUser;
    _view.logged(currentUser != null);

    // final sp = await SharedPreferences.getInstance();
    // final accessToken = sp.getString('accessToken');
    // _view.logged(accessToken != null);
  }

  @override
  set view(view) => _view = view;

  
}