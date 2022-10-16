import 'package:fwc_album_app/app/models/groups_stickers.dart';

abstract class StickersRepository {
  Future<List<GroupsStickers>> getMyAlbum();
}