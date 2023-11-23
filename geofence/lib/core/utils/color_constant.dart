import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray7000f = fromHex('#0f555555');

  static Color blueGray200 = fromHex('#bac1ce');

  static Color blueGray100 = fromHex('#d6dae2');

  static Color red700 = fromHex('#d03329');

  static Color blueGray400 = fromHex('#74839d');

  static Color blueGray300 = fromHex('#9ea8ba');

  static Color blueA700 = fromHex('#0061ff');

  static Color gray900 = fromHex('#0f0e17');

  static Color gray90001 = fromHex('#0d062d');

  static Color green600 = fromHex('#349765');

  static Color gray50 = fromHex('#f9fbff');

  static Color gray100 = fromHex('#fbf1f2');

  static Color deepOrangeA10033 = fromHex('#33dfa874');

  static Color black90011 = fromHex('#11000000');

  static Color black900 = fromHex('#000000');

  static Color blueGray900 = fromHex('#262b35');

  static Color deepOrange400 = fromHex('#d58c48');

  static Color black90019 = fromHex('#19000000');

  static Color blue200 = fromHex('#a6c8ff');

  static Color blueGray40001 = fromHex('#888888');

  static Color whiteA700 = fromHex('#ffffff');

  static Color gray70011 = fromHex('#11555555');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
