import 'package:flutter/material.dart';
import 'package:xafe/app/authentication/presentation/widgets/sign_up_screen_widget.dart';

class SignUpScreen1 extends StatefulWidget {
  @override
  _SignUpScreen1State createState() => _SignUpScreen1State();
}

class _SignUpScreen1State extends State<SignUpScreen1> {
  @override
  Widget build(BuildContext context) {
    return const SignUpScreenWidget(
      title: 'What’s your name?',
      hintText: 'Enter your first name and last name',
      buttonTitle: 'Next',
    );
  }
}
