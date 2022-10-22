import 'package:fwc_album_app/app/models/groups_stickers.dart';
import 'package:fwc_album_app/app/pages/my_stickers/view/my_sticker_view.dart';
import 'package:fwc_album_app/app/repository/stickers/stickers_repository.dart';

import 'my_sticker_presenter.dart';

class MyStickerPresenterImpl implements MyStickerPresenter {
  final StickersRepository stickersRepository;
  late final MyStickerView _view;
  var album = <GroupsStickers>[];
  var statusSelected = 'all';
  List<String>? countries;

  MyStickerPresenterImpl({
    required this.stickersRepository,
  });

  @override
  Future<void> getMyAlbum() async {
    album = await stickersRepository.getMyAlbum();
    _view.loadedPage([...album]);
  }

  @override
  set view(MyStickerView view) => _view = view;

  @override
  Future<void> statusFilter(String status) async {
    statusSelected = status;
    _view.updateStatusFilter(status);
  }

  @override
  void countryFilter(List<String>? countries) {
    this.countries = countries;
    if (countries == null) {
      _view.updateAlbum(album);
    } else {
      final albumFilter = [
        ...album.where((element) => countries.contains(element.countryCode))
      ];
      _view.updateAlbum(albumFilter);
    }
  }

  @override
  void refresh() async {
    _view.showLoader();
    await getMyAlbum();
    countryFilter(countries);
    statusFilter(statusSelected);
  }
}
