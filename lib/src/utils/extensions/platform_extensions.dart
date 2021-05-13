import 'dart:io';
import 'package:flutter/material.dart';

extension PlatformExtensions on BuildContext {
  bool get isIOS => Platform.isIOS;
  bool get isAndroid => Platform.isAndroid;
}
