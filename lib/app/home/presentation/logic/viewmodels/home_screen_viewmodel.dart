import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xafe/src/res/res.dart';
import 'package:xafe/src/res/values/assets/svgs/svgs.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

class HomeScreenViewModel extends ChangeNotifier {
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
        return IntrinsicHeight(
          child: Container(
            padding: context.insetsSymetric(
              horizontal: 20,
            ),
            decoration: const BoxDecoration(
              color: kColorWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                const YMargin(22.16),
                Container(
                  width: context.scaleY(50),
                  height: context.scaleY(5),
                  decoration: BoxDecoration(
                    color: kColorBlackish.withOpacity(0.1),
                  ),
                ),
                const YMargin(40.66),
                BottomSheetItem(),
                Padding(
                  padding: context.insetsOnly(left: 40.0, top: 25,),
                  child: const Divider(
                    height: 0,
                  ),
                ),
                const YMargin(25),
                BottomSheetItem(),
                Padding(
                  padding: context.insetsOnly(left: 40.0, top: 25),
                  child: const Divider(
                    height: 0,
                  ),
                ),
                 const YMargin(25),
                BottomSheetItem(),
                Padding(
                  padding: context.insetsOnly(left: 40.0, top: 20),
                  child: const Divider(
                    height: 0,
                  ),
                ),

                const YMargin(128.62),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BottomSheetItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(kPenIcon),
        const XMargin(17),
        const Text(
          'Add an Expense',
          style: TextStyle(
            color: kColorAppBlack,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
