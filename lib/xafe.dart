import 'package:flutter/material.dart';
import 'package:xafe/app/splash_screen/presentation/screens/splash_screen.dart';
import 'package:xafe/src/res/res.dart';

class Xafe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xafe',
      theme: xafeTheme(context),
      home: SplashScreen(),
    );
  }
}
