import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/models/groups_stickers.dart';

import '../../../models/user_sticker_model.dart';

class StickerGroup extends StatelessWidget {
  final GroupsStickers group;
  final String statusFilter;

  const StickerGroup(
      {super.key, required this.group, required this.statusFilter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Expanded(
                child: Text(
                  group.countryName,
                  style: context.textStyles.titleBlack.copyWith(fontSize: 24),
                ),
              ),
              Container(
                height: 60,
                width: 80,
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  'assets/images/flags/${group.countryCode}.png',
                  fit: BoxFit.cover,
                ),
              ),
            ]),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final stickerNumber = '${group.stickersStart + index}';
              final stickerList = group.stickers
                  .where((sticker) => sticker.stickerNumber == stickerNumber);

              final sticker = stickerList.isNotEmpty ? stickerList.first : null;

              final stickerWidget = Sticker(
                stickerNumber: stickerNumber,
                sticker: sticker,
                countryName: group.countryName,
                countryCode: group.countryCode,
              );
              if (statusFilter == 'all') {
                return stickerWidget;
              } else if (statusFilter == 'missing') {
                if (sticker == null) {
                  return stickerWidget;
                }
              } else if (statusFilter == 'repeated') {
                if (sticker != null && sticker.duplicate > 0) {
                  return stickerWidget;
                }
              }

              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}

class Sticker extends StatelessWidget {
  final String stickerNumber;
  final UserStickerModel? sticker;
  final String countryName;
  final String countryCode;

  const Sticker({
    super.key,
    required this.stickerNumber,
    required this.sticker,
    required this.countryName,
    required this.countryCode,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/sticker-detail');
      },
      child: Container(
        color: sticker != null ? context.colors.primary : context.colors.grey,
        child: Column(children: [
          Visibility(
            visible: (sticker?.duplicate ?? 0) > 0,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.all(2),
              child: Text(
                sticker?.duplicate.toString() ?? '',
                style: context.textStyles.textsecondaryFontMedium
                    .copyWith(color: context.colors.yellow),
              ),
            ),
          ),
          Text(countryCode,
              style: context.textStyles.textsecondaryFontExtraBold.copyWith(
                  color: sticker != null ? Colors.white : Colors.black)),
          Text(stickerNumber,
              style: context.textStyles.textsecondaryFontExtraBold.copyWith(
                  color: sticker != null ? Colors.white : Colors.black))
        ]),
      ),
    );
  }
}
