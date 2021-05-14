import 'package:flutter/material.dart';
import 'package:xafe/src/res/res.dart';
import 'package:xafe/src/utils/navigation/navigation.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

class BudgetDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kColorBlue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const YMargin(70.47),
            Padding(
              padding: context.insetsSymetric(
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          popView(context);
                        },
                        child: Icon(
                          Icons.chevron_left,
                          color: kColorWhite,
                          size: context.scaleY(19),
                        ),
                      ),
                      const Text(
                        '‍Family',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: kColorWhite,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                          backgroundColor: kColorWhite.withOpacity(0.12),
                          radius: context.scaleY(24),
                          child: Icon(
                            Icons.add,
                            size: context.scaleY(21),
                            color: kColorWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const YMargin(42.58),
                  RichText(
                    text: const TextSpan(
                      text: r'$ 200.00 ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 32,
                        color: kColorWhite,
                      ),
                      children: [
                        TextSpan(
                          text: 'spent',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: kColorWhite,
                          ),
                        )
                      ],
                    ),
                  ),
                  const YMargin(10),
                  Stack(
                    children: [
                      Container(
                        height: context.scaleY(11),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: kColorWhite.withOpacity(0.12),
                        ),
                      ),
                      Container(
                        height: context.scaleY(11),
                        width: context.scaleY(199.85),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: kColorWhite,
                        ),
                      ),
                    ],
                  ),
                  const YMargin(17),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: context.insetsAll(10),
                      decoration: BoxDecoration(
                        color: kColorWhite.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Text(
                        r'$1000/month',
                        style: TextStyle(
                          color: kColorWhite,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const YMargin(40.16),
                ],
              ),
            ),
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
