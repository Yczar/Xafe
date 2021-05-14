import 'package:flutter/material.dart';
import 'package:xafe/app/authentication/presentation/widgets/sign_up_screen_widget.dart';

class SignUpScreen3 extends StatefulWidget {
  @override
  _SignUpScreen3State createState() => _SignUpScreen3State();
}

class _SignUpScreen3State extends State<SignUpScreen3> {
  @override
  Widget build(BuildContext context) {
    return const SignUpScreenWidget(
      title: 'Enter the code',
      hintText: 'Enter the code sent to your email address',
      buttonTitle: 'Next',
      keyBoardType: TextInputType.number,
    );
  }
}
