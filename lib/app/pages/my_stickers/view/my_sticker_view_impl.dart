import 'package:flutter/cupertino.dart';
import 'package:fwc_album_app/app/core/exceptions/repository_exception.dart';
import 'package:fwc_album_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/app/core/ui/helpers/messages.dart';
import 'package:fwc_album_app/app/models/groups_stickers.dart';
import 'package:fwc_album_app/app/pages/my_stickers/my_stickers_page.dart';
import 'package:fwc_album_app/app/pages/my_stickers/view/my_sticker_view.dart';

abstract class MyStickerViewImpl extends State<MyStickersPage>
    with Messages<MyStickersPage>, Loader<MyStickersPage>
    implements MyStickerView {
  var album = <GroupsStickers>[];
  var statusFilter = 'all';
  var countries = <String, String>{};

  @override
  void initState() {
    try {
      widget.presenter.view = this;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        showLoader();
        widget.presenter.getMyAlbum();
      });
    } catch (e) {
      showError("Não foi possível carregar o álbum");
    }

    super.initState();
  }

  @override
  void error(String message){
    hideLoader();
    showError(message);
  }

  @override
  void loadedPage(List<GroupsStickers> album) {
    hideLoader();
    setState(() {
      this.album = album;
      countries = {for (var c in album) c.countryCode: c.countryName};
    });
  }

  @override
  void updateStatusFilter(status) {
    setState(() {
      statusFilter = status;
    });
  }

  @override
  void updateAlbum(List<GroupsStickers> album) {
    hideLoader();
    setState(() {
      this.album = album;
    });
  }
}
