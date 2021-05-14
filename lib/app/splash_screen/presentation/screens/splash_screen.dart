import 'package:flutter/material.dart';
import 'package:xafe/app/authentication/presentation/screens/login_screen.dart';
import 'package:xafe/app/authentication/presentation/screens/signup/signup_screen_1.dart';
import 'package:xafe/src/res/components/buttons/src/xafe_button.dart';
import 'package:xafe/src/res/values/colors/colors.dart';
import 'package:xafe/src/utils/navigation/navigation.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorAppBlack,
      body: SafeArea(
        child: Padding(
          padding: context.insetsSymetric(
            horizontal: 20.0,
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: context.insetsOnly(
                    bottom: 12,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'xafe',
                          style: TextStyle(
                            color: kColorWhite,
                            fontWeight: FontWeight.w600,
                            fontSize: 32,
                          ),
                        ),
                        const YMargin(20),
                        const Text(
                          'Smart Budgeting',
                          style: TextStyle(
                            color: kColorWhite,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: context.insetsOnly(
                    bottom: 107,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      XafeButton(
                        onPressed: () { navigate(
                          context,
                          LoginScreen(),
                        );},
                        text: 'Login',
                      ),
                      const YMargin(70),
                      InkWell(
                        onTap: () {
                          navigate(
                            context,
                            SignUpScreen1(),
                          );
                        },
                        child: RichText(
                          text: const TextSpan(
                              text: 'New here?',
                              style: TextStyle(
                                color: kColorWhite,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: ' Create an account',
                                  style: TextStyle(
                                    color: kColorWhite,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      const YMargin(70),
                      const Text(
                        // ignore: lines_longer_than_80_chars
                        'By continuing, you agree to Xafe’s terms of use \nand privacy policy',
                        style: TextStyle(
                          color: kColorWhite,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
