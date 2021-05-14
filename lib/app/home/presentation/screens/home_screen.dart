import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:xafe/app/home/presentation/logic/viewmodels/home_screen_viewmodel.dart';
import 'package:xafe/src/res/res.dart';
import 'package:xafe/src/res/values/assets/svgs/svgs.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBlue,
      body: SafeArea(
        child: Column(
          children: [
            const YMargin(48.02),
            Padding(
              padding: context.insetsSymetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: context.insetsOnly(
                      left: 10,
                      top: 12.04,
                      bottom: 14.04,
                      right: 19.04,
                    ),
                    decoration: BoxDecoration(
                      color: kColorWhite.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          'This week',
                          style: TextStyle(
                            color: kColorWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const XMargin(6),
                        Icon(
                          Icons.arrow_drop_down,
                          color: kColorWhite,
                          size: context.scaleY(12),
                        ),
                      ],
                    ),
                  ),
                  ViewModelBuilder<HomeScreenViewModel>.reactive(
                      viewModelBuilder: () => HomeScreenViewModel(),
                      builder: (_, model, __) {
                        return CircleAvatar(
                          backgroundColor: kColorWhite,
                          radius: context.scaleY(24),
                          child: InkWell(
                            onTap: () {
                              model.showBottomSheet(context);
                            },
                            child: SvgPicture.asset(
                              kPenIcon,
                              height: context.scaleY(19.97),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
            const YMargin(52.77),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Expenses',
                          style: TextStyle(
                            color: kColorWhite,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        const Text(
                          r'$4,750.00',
                          style: TextStyle(
                            color: kColorWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const XMargin(50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: context.scaleY(140),
                      width: context.scaleY(70),
                      decoration: BoxDecoration(
                        color: kColorWhite,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const YMargin(20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Income',
                          style: TextStyle(
                            color: kColorWhite,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        const Text(
                          r'$9,500.00',
                          style: TextStyle(
                            color: kColorWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const YMargin(56.69),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: kColorWhite,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    const YMargin(26.07),
                    Container(
                      width: context.scaleY(50),
                      height: context.scaleY(5),
                      decoration: BoxDecoration(
                        color: kColorBlackish.withOpacity(0.1),
                      ),
                    ),
                    const YMargin(30),
                    Expanded(
                      child: ListView.separated(
                        itemCount: 5,
                        separatorBuilder: (_, __) => Divider(
                          height: 0,
                          color: const Color(0xFF9A96A4).withOpacity(0.1),
                        ),
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: context.insetsSymetric(
                              vertical: 28.0,
                              horizontal: 20.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '📄 Bill Payments',
                                  style: TextStyle(
                                    color: kColorAppBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Text(
                                  r'$500.00',
                                  style: TextStyle(
                                    color: kColorAppBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
