import 'package:flutter/material.dart';

import 'colorz.dart';

class CustomTheme {
  static TextStyle get textStyleTextBig {
    return const TextStyle(
      fontStyle: FontStyle.normal,
      color: Colorz.black,
      fontSize: 30,
      fontWeight: FontWeight.w600,
      height: 1.26,
      letterSpacing: 0,
    );
  }
}
