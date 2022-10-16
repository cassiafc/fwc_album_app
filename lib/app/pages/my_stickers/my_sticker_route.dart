import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/pages/my_stickers/my_stickers_page.dart';
import 'package:fwc_album_app/app/pages/my_stickers/presenter/my_sticker_presenter.dart';
import 'package:fwc_album_app/app/pages/my_stickers/presenter/my_sticker_presenter_impl.dart';
import 'package:fwc_album_app/app/repository/stickers/stickers_repository.dart';
import 'package:fwc_album_app/app/repository/stickers/stickers_repository_impl.dart';

class MyStickerRoute extends FlutterGetItPageRoute {
  const MyStickerRoute({super.key});

  List<Bind<Object>> get bindings => [
    Bind.lazySingleton<StickersRepository>(
        (i) => StickersRepositoryImpl(dio: i())),
    Bind.lazySingleton<MyStickerPresenter>(
        (i) => MyStickerPresenterImpl(stickersRepository: i()))
  ];

  @override
  WidgetBuilder get page =>
          (context) => MyStickersPage(presenter: context.get());

}