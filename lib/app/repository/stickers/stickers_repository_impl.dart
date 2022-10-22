import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fwc_album_app/app/core/exceptions/repository_exception.dart';
import 'package:fwc_album_app/app/core/rest/custom_dio.dart';
import 'package:fwc_album_app/app/models/groups_stickers.dart';
import 'package:fwc_album_app/app/models/registe_Sticker_model.dart';
import 'package:fwc_album_app/app/models/sticker_model.dart';
import 'package:fwc_album_app/app/models/user_sticker_model.dart';
import 'package:fwc_album_app/app/repository/stickers/stickers_repository.dart';

class StickersRepositoryImpl implements StickersRepository {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CustomDio dio;

  StickersRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<GroupsStickers>> getMyAlbum() async {
    final User? currentUser = auth.currentUser;
    final countriesRef = firestore.collection("countries");
    final albumsRef = firestore.collection("albums");

    QuerySnapshot countriesSnapshot = await countriesRef.get();

    DocumentSnapshot album = await albumsRef.doc(currentUser?.uid).get();

    if (!album.exists) {
      await albumsRef
          .doc(currentUser?.uid)
          .set(countriesToMap(countriesSnapshot));
    }

    List<GroupsStickers> list = countriesSnapshot.docs
        .map<GroupsStickers>(
            (e) => GroupsStickers.forMap(e.data() as Map<String, dynamic>))
        .toList();

    list.sort((a, b) => a.id.compareTo(b.id));

    return list;
  }

  Map<String, dynamic> countriesToMap(QuerySnapshot countriesSnapshot) {
    return {
      'countries': countriesSnapshot.docs
          .map((e) => countryToMap(e.data() as Map<String, dynamic>))
          .toList(),
    };
  }

  Map<String, dynamic> countryToMap(Map<String, dynamic> map) {
    return {
      'id': map['id']?.toInt() ?? 0,
      'country_code': map['country_code'] ?? '',
      'stickers': List<UserStickerModel>.from(
          map['stickers']?.map((x) => UserStickerModel.fromMap(x))),
    };
  }

  @override
  Future<StickerModel?> findsStickerByCode(
      String stickerCode, String stickerNumber) async {
    try {
      final result =
          await dio.auth().get('/api/sticker-search', queryParameters: {
        'sticker_code': stickerCode,
        'sticker_number': stickerNumber,
      });
      return StickerModel.fromMap(result.data);
    } on DioError catch (e, s) {
      if (e.response?.statusCode == 404) {
        return null;
      }
      log('Erro ao buscar figurinha', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar figurinha');
    }
  }

  @override
  Future<StickerModel> create(RegisterStickerModel registerStickerModel) async {
    try {
      final body = FormData.fromMap({
        ...registerStickerModel.toMap(),
        'sticker_image_upload': '',
      });
      final result = await dio.auth().post('/api/sticker', data: body);
      return StickerModel.fromMap(result.data);
    } on DioError catch (e, s) {
      log('Erro ao registrar figurinha', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao registrar figurinha');
    }
  }

  @override
  Future<void> registerUserSticker(int stickerID, int amount) async {
    try {
      await dio.auth().post('/api/user/sticker', data: {
        'id_sticker': stickerID,
        'amount': amount,
      });
    } on DioError catch (e, s) {
      log('Erro ao inserir figurinha no album do usuário',
          error: e, stackTrace: s);
      throw RepositoryException(
          message: 'Erro ao inserir figurinha no album do usuário');
    }
  }

  @override
  Future<void> updateUserSticker(int stickerID, int amount) async {
    try {
      await dio.auth().put('/api/user/sticker', data: {
        'id_sticker': stickerID,
        'amount': amount,
      });
    } on DioError catch (e, s) {
      log('Erro ao atualizar figurinha no album do usuário',
          error: e, stackTrace: s);
      throw RepositoryException(
          message: 'Erro ao atualizar figurinha no album do usuário');
    }
  }
}
