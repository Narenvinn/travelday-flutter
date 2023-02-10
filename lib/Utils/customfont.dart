import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:travelpay/Utils/constants.dart';



class Customfont {
  static textFontSet(double fontsize, Color color, FontWeight? fontWeight) {
    return TextStyle(
        fontFamily: Constants.customFontFamily,
        fontSize: fontsize,
        fontWeight: fontWeight,
        color: color);
  }
}
