import 'package:flutter/material.dart';
import 'package:xafe/src/res/components/buttons/src/xafe_button.dart';
import 'package:xafe/src/res/res.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

class SignUpScreen1 extends StatefulWidget {
  @override
  _SignUpScreen1State createState() => _SignUpScreen1State();
}

class _SignUpScreen1State extends State<SignUpScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: context.insetsSymetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const YMargin(66.45),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.chevron_left,
                      size: context.scaleY(19),
                      color: kColorAppGrey,
                    ),
                    const Text(
                      'Sign up',
                      style: TextStyle(
                        color: kColorAppBlack,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(),
                  ],
                ),
                const YMargin(60.45),
                const Text(
                  'What’s your name?',
                  style: TextStyle(
                    color: kColorAppBlack,
                    fontWeight: FontWeight.w600,
                    fontSize: 38,
                  ),
                ),
                const YMargin(12),
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    isDense: true,
                    contentPadding: context.insetsAll(0),
                    hintText: 'Enter your first name and last name',
                    hintStyle: const TextStyle(
                      color: kColorAppGrey,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ),
                const YMargin(176.95),
                Stack(
                  children: [
                    Container(
                      height: context.scaleY(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kColorAltStroke,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    Container(
                      height: context.scaleY(10),
                      width: context.scale(93.5),
                      decoration: const BoxDecoration(
                        color: kColorBlack,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
                const YMargin(20),
                XafeButton(
                  text: 'Next',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
