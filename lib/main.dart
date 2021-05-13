import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xafe/xafe.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(
      Xafe(),
    ),
  );
}
