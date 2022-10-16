import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fwc_album_app/app/core/exceptions/repository_exception.dart';
import 'package:fwc_album_app/app/core/rest/custom_dio.dart';
import 'package:fwc_album_app/app/models/user_model.dart';
import 'package:fwc_album_app/app/repository/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final CustomDio dio;

  UserRepositoryImpl({
    required this.dio,
  });

  @override
  Future<UserModel> getMe() async {
    try {
      final User? currentUser = auth.currentUser;

      if (currentUser != null) {
        DocumentSnapshot doc =
            await firestore.collection('usuarios').doc(currentUser.uid).get();

        if (!doc.exists) {
          return addUser(currentUser);
        } else {
          return UserModel.fromMap(doc.data() as Map<String, dynamic>);
        }
      } else {
        throw RepositoryException(
            message: 'Erro ao buscar dados do usuário logado');
      }
    } on DioError catch (e, s) {
      log('Erro ao buscar dados do usuário logado', error: e, stackTrace: s);
      throw RepositoryException(
          message: 'Erro ao buscar dados do usuário logado');
    }
  }

  @override
  Future<UserModel> addUser(User user) async {
    await FirebaseFirestore.instance.collection('usuarios').doc(user.uid).set({
      "id": 1,
      "name": user.email,
      "email": user.email,
      "token": "8e70861a-9b20-4d22-a62e-3161898e9611",
      "created_at": DateTime.now(),
      "updated_at": DateTime.now(),
      "total_album": 634,
      "total_stickers": 0,
      "total_duplicates": 0,
      "total_complete": 634,
      "total_complete_percent": 0
    });

    DocumentSnapshot doc =
        await firestore.collection('usuarios').doc(user.uid).get();

    return UserModel.fromMap(doc.data() as Map<String, dynamic>);
  }
}
