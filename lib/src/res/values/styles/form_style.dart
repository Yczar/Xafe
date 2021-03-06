import 'package:flutter/material.dart';
import 'package:xafe/src/res/res.dart';

const _borderRadius = BorderRadius.all(
  Radius.circular(16),
);

OutlineInputBorder _borderStyle = const OutlineInputBorder(
  borderRadius: _borderRadius,
  borderSide: BorderSide.none,
);

OutlineInputBorder _enableBorderStyle = const OutlineInputBorder(
  borderRadius: _borderRadius,
  borderSide: BorderSide.none,
);

OutlineInputBorder _focusedBorderStyle = const OutlineInputBorder(
  borderRadius: _borderRadius,
  borderSide: BorderSide.none,
);

OutlineInputBorder _errorBorderStyle = const OutlineInputBorder(
  borderRadius: _borderRadius,
  borderSide: BorderSide.none,
);

InputDecorationTheme _xafeFormTheme = InputDecorationTheme(
  border: _borderStyle,
  enabledBorder: _enableBorderStyle,
  hintStyle: const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: kColorBlackish,
  ),
  focusedBorder: _focusedBorderStyle,
  disabledBorder: _borderStyle,
  filled: true,
  errorBorder: _errorBorderStyle,
  focusedErrorBorder: _focusedBorderStyle,
);

InputDecorationTheme get xafeFormTheme => _xafeFormTheme;
