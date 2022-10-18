import 'package:firebase_auth/firebase_auth.dart';
import 'package:fwc_album_app/app/models/register_user_model.dart';

import '../../models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getMe();

  Future<UserModel> addUser(RegisterUserModel1 user);
}
