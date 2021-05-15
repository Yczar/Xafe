import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xafe/src/res/values/assets/svgs/svgs.dart';
import 'package:xafe/src/utils/navigation/navigation.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

class KAppBackArrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => popView(context),
      child: SvgPicture.asset(
        kBackArrowIcon,
        height: context.scaleY(19),
      ),
    );
  }
}
