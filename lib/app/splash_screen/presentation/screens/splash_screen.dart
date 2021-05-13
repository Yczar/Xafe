import 'package:flutter/material.dart';
import 'package:xafe/src/res/values/colors/colors.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorAppBlack,
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: context.insetsOnly(
                bottom: 12,
              ),
              child: Column(
                children: [
                  const Text(
                    'Xafe',
                    style: TextStyle(
                      color: kColorAppBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                    ),
                  ),
                  const YMargin(20),
                  const Text(
                    'Smart Budgeting',
                    style: TextStyle(
                      color: kColorAppBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
