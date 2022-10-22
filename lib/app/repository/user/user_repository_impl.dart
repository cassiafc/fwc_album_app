import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fwc_album_app/app/core/exceptions/repository_exception.dart';
import 'package:fwc_album_app/app/core/rest/custom_dio.dart';
import 'package:fwc_album_app/app/models/register_user_model.dart';
import 'package:fwc_album_app/app/models/user_model.dart';
import 'package:fwc_album_app/app/repository/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('users');

  final CustomDio dio;

  UserRepositoryImpl({
    required this.dio,
  });

  @override
  Future<UserModel> getMe() async {
    try {
      final User? currentUser = auth.currentUser;

      DocumentSnapshot doc = await collectionRef.doc(currentUser?.uid).get();

      if (!doc.exists) {
        throw RepositoryException(
            message: 'Erro ao buscar dados do usuário logado');
      } else {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>);
      }
    } on DioError catch (e, s) {
      log('Erro ao buscar dados do usuário logado', error: e, stackTrace: s);
      throw RepositoryException(
          message: 'Erro ao buscar dados do usuário logado');
    }
  }

  @override
  Future<UserModel> addUser(RegisterUserModel1 user) async {
    await collectionRef.doc(user.uid).set(user.toMapSave());

    DocumentSnapshot doc = await collectionRef.doc(user.uid).get();

    return UserModel.fromMap(doc.data() as Map<String, dynamic>);
  }
}
