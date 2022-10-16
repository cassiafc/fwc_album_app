import 'package:fwc_album_app/app/models/user_model.dart';

abstract class HomeView {


  void updateUser(UserModel user);
  void erro(String message);
  void showLoader();
  void logoutSuccess();
}