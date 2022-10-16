import 'package:fwc_album_app/app/models/groups_stickers.dart';
import '../../models/registe_Sticker_model.dart';
import '../../models/sticker_model.dart';

abstract class StickersRepository {
  Future<List<GroupsStickers>> getMyAlbum();
  Future<StickerModel?> findsStickerByCode(
      String stickerCode, String stickerNumber);
  Future<StickerModel> create (RegisterStickerModel registerStickerModel);
  Future<void> registerUserSticker(int stickerID, int amount);
  Future<void> updateUserSticker(int stickerID, int amount);
}