import 'package:firebase_auth/firebase_auth.dart';

import '../../models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getMe();
  Future<UserModel> addUser(User user);
}