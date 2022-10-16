import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import '../styles/text_styles.dart';

class ThemeConfig {
  ThemeConfig._();

  static final _defaultInputBorde = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide(color: ColorsApp.i.greyDart, width: 1)
  );

  static final theme =  ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(
            color: Colors.black
        ),
        titleTextStyle: TextStyles.i.textPrimaryFontBold
            .copyWith(color: Colors.black, fontSize: 18),
      ),
      primaryColor: ColorsApp.i.primary,
      colorScheme: ColorScheme.fromSeed(
          primary: ColorsApp.i.primary,
          seedColor: ColorsApp.i.secondary
      ),
      inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          isDense: true,
          contentPadding: const EdgeInsets.all(13),
          border: _defaultInputBorde,
          enabledBorder: _defaultInputBorde,
          focusedBorder: _defaultInputBorde,
          labelStyle: TextStyles.i.labelTextField
      ),
  );
}