
import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();
  
  static ColorsApp get i{
    _instance??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xFF791435);
  Color get secondary => const Color(0xFFFDCE50);
  Color get yellow => const Color(0xFFFDCE50);
  Color get grey => const Color(0xFFCCCCCC);
  Color get greyDart => const Color(0xFF999999);

}

extension ColorsAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}