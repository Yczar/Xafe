import 'package:flutter/material.dart';

import '../res.dart';

ThemeData xafeTheme(BuildContext context) => ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      canvasColor: kColorWhite,
      primarySwatch: const MaterialColor(
        0xFF0F0627,
        <int, Color>{
          50: kColorAppBlack,
          100: kColorAppBlack,
          200: kColorAppBlack,
          300: kColorAppBlack,
          400: kColorAppBlack,
          500: kColorAppBlack,
          600: kColorAppBlack,
          700: kColorAppBlack,
          800: kColorAppBlack,
          900: kColorAppBlack,
        },
      ),
      primaryColor: kColorAppBlack,
      backgroundColor: kColorWhite,
      scaffoldBackgroundColor: kColorWhite,
      brightness: Brightness.light,
      fontFamily: 'EuclidaCircular',
    );
