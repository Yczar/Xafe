import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xafe/src/res/res.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

class HomeScreenViewModel extends ChangeNotifier {
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: const BoxDecoration(
              color: kColorWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: context.scaleY(83.99),
                  width: context.scaleY(70),
                  decoration: BoxDecoration(
                    color: kColorWhite,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const YMargin(20),
              ],
            ),
          );
        });
  }
}
