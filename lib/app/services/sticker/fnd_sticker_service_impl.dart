import 'package:fwc_album_app/app/models/registe_Sticker_model.dart';
import 'package:fwc_album_app/app/models/sticker_model.dart';
import 'package:fwc_album_app/app/repository/stickers/stickers_repository.dart';
import 'find_sticker_service.dart';

class FindStickerServiceImpl implements FindStickerService {
final StickersRepository stickersRepository;

FindStickerServiceImpl({required this.stickersRepository});

  @override
  Future<StickerModel> execute(String countryCode, String stickerNumber) async {
  var sticker =
      await stickersRepository.findsStickerByCode(countryCode, stickerNumber);
  if(sticker == null) {
    final registerSticker = RegisterStickerModel(
        name: '',
        stickerCode: countryCode,
        stickerNumber: stickerNumber,
    );
    sticker = await stickersRepository.create(registerSticker);
  }
  return sticker;
  }

}