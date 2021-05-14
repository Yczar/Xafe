import 'package:flutter/material.dart';
import 'package:xafe/src/res/components/buttons/src/xafe_button.dart';
import 'package:xafe/src/res/res.dart';
import 'package:xafe/src/utils/navigation/navigation.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: context.insetsSymetric(
            horizontal: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const YMargin(66.45),
              InkWell(
                onTap: () {
                  popView(context);
                },
                child: Icon(
                  Icons.chevron_left,
                  size: context.scaleY(19),
                  color: kColorAppGrey,
                ),
              ),
              const YMargin(60.45),
              const Text(
                'Welcome back',
                style: TextStyle(
                  color: kColorAppBlack,
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                ),
              ),
              const Text(
                'Login to your account',
                style: TextStyle(
                  color: kColorBlackish,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              const YMargin(13),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'email address',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: '• • • • • • • • • • ',
                ),
              ),
              const YMargin(32),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: context.insetsSymetric(
                    horizontal: 10,
                    vertical: 6.5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kColorAltStroke,
                  ),
                  child: const Text(
                    'forgot password ?',
                    style: TextStyle(
                      color: kColorAppBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              XafeButton(
                text: 'Login', onPressed: () {  },
              ),
              const YMargin(80),
            ],
          ),
        ),
      ),
    );
  }
}
