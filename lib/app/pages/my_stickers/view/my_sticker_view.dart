import 'package:fwc_album_app/app/models/groups_stickers.dart';

abstract class MyStickerView{
  void loadedPage(List<GroupsStickers> album);
  void error(String message);
  void updateStatusFilter(status);
  void updateAlbum(List<GroupsStickers> album);

}