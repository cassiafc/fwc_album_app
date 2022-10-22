import 'package:fwc_album_app/app/core/mvp/fwc_presenter.dart';
import '../view/my_sticker_view.dart';

abstract class MyStickerPresenter extends FwcPresenter<MyStickerView> {
  Future<void> getMyAlbum();

  Future<void> statusFilter(String status);

  void countryFilter(List<String>? countries);

  void refresh();
}
