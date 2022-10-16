import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fwc_album_app/app/core/exceptions/repository_exception.dart';
import 'package:fwc_album_app/app/core/rest/custom_dio.dart';
import 'package:fwc_album_app/app/models/groups_stickers.dart';
import 'package:fwc_album_app/app/repository/stickers/stickers_repository.dart';

class StickersRepositoryImpl implements StickersRepository {

  final CustomDio dio;
  StickersRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<GroupsStickers>> getMyAlbum() async {
    try {
      final result = await dio.auth().get('/api/countries');
      return result.data
          .map<GroupsStickers>((g) => GroupsStickers.forMap(g))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar album do usuário', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar album do usuário');
    }
  }

}