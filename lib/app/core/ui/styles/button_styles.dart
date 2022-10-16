import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'text_styles.dart';

class ButtonStyles {
  static ButtonStyles? _instance;

  ButtonStyles._();

  static ButtonStyles get i {
    _instance ??= ButtonStyles._();
    return _instance!;
  }

  ButtonStyle get yellowButton => ElevatedButton.styleFrom(
        primary: ColorsApp.i.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
     textStyle:  TextStyles.i.textsecondaryFontExtraBold.copyWith(
      fontSize: 14
    )
      );

  ButtonStyle get yellowOutlineButton => OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      side: BorderSide(color: ColorsApp.i.yellow),
      textStyle:  TextStyles.i.textsecondaryFontExtraBold.copyWith(
          fontSize: 14
      )
  );

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
      primary: ColorsApp.i.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      textStyle:  TextStyles.i.textsecondaryFontExtraBold.copyWith(
          fontSize: 14
      )
  );

  ButtonStyle get primaryOutlineButton => OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      side: BorderSide(color: ColorsApp.i.primary),
      textStyle:  TextStyles.i.textsecondaryFontExtraBold.copyWith(
          fontSize: 14
      )
  );
}

extension ButtonStylesExtension on BuildContext {
  ButtonStyles get buttonStyles => ButtonStyles.i;
}
