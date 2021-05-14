import 'package:flutter/material.dart';
import 'package:xafe/app/authentication/presentation/screens/signup/signup_screen_3.dart';
import 'package:xafe/app/authentication/presentation/widgets/sign_up_screen_widget.dart';
import 'package:xafe/src/utils/navigation/navigation.dart';

class SignUpScreen2 extends StatefulWidget {
  @override
  _SignUpScreen2State createState() => _SignUpScreen2State();
}

class _SignUpScreen2State extends State<SignUpScreen2> {
  @override
  Widget build(BuildContext context) {
    return SignUpScreenWidget(
      title: 'What’s your email?',
      hintText: 'Enter your email address',
      buttonTitle: 'Next',
      onPressed: () {
        navigate(
          context,
          SignUpScreen3(),
        );
      },
    );
  }
}
