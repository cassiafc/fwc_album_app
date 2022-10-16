
import 'package:flutter/material.dart';

import 'colors_app.dart';

class TextStyles {
  static TextStyles? _instance;
  TextStyles._();

  static TextStyles get i{
    _instance??= TextStyles._();
    return _instance!;
  }

  String get primaryFont => 'Poppins';
  String get secondaryFont => 'MPlus1P';

  //primary font
TextStyle get textPrimaryFontRegular =>
    TextStyle(fontWeight: FontWeight.normal, fontFamily: primaryFont);

TextStyle get textPrimaryFontMedium =>
    TextStyle(fontWeight: FontWeight.w500, fontFamily: primaryFont);

TextStyle get textPrimaryFontSemiBold =>
    TextStyle(fontWeight: FontWeight.w600, fontFamily: primaryFont);

TextStyle get textPrimaryFontBold =>
    TextStyle(fontWeight: FontWeight.bold, fontFamily: primaryFont);

TextStyle get textPrimaryFontExtraBold =>
    TextStyle(fontWeight: FontWeight.w800, fontFamily: primaryFont);

//secondary font
  TextStyle get textsecondaryFontRegular =>
      TextStyle(fontWeight: FontWeight.normal, fontFamily: secondaryFont);

  TextStyle get textsecondaryFontMedium =>
      TextStyle(fontWeight: FontWeight.w600, fontFamily: secondaryFont);

  TextStyle get textsecondaryFonttBold =>
      TextStyle(fontWeight: FontWeight.bold, fontFamily: secondaryFont);

  TextStyle get textsecondaryFontExtraBold =>
      TextStyle(fontWeight: FontWeight.w800, fontFamily: secondaryFont);

  TextStyle get labelTextField => textsecondaryFontRegular.copyWith(
    color: ColorsApp.i.greyDart,
  );

  TextStyle get textsecondaryFontExtraBoldPrimaryColor => textsecondaryFontExtraBold
      .copyWith(color: ColorsApp.i.primary
  );

  TextStyle get titleWhite => textPrimaryFontBold.copyWith(
    fontSize: 22,
    color: Colors.white,
  );

  TextStyle get titleBlack => textPrimaryFontBold.copyWith(
    fontSize: 22,
    color: Colors.black
  );
  TextStyle get titlePrimaryColor =>
      textPrimaryFontBold.copyWith(color: ColorsApp.i.primary, fontSize: 22);
}
extension TextStylesExtensions on BuildContext{
  TextStyles get textStyles => TextStyles.i;
}