import 'package:flutter/material.dart';
import 'package:xafe/app/authentication/data/models/user_model.dart';
import 'package:xafe/app/authentication/presentation/screens/signup/signup_screen_3.dart';
import 'package:xafe/app/authentication/presentation/widgets/sign_up_screen_widget.dart';
import 'package:xafe/src/utils/navigation/navigation.dart';

class SignUpScreen4 extends StatefulWidget {

  const SignUpScreen4({
    Key key,
    this.userModel,
  }) : super(key: key);

  final UserModel userModel;
  @override
  _SignUpScreen4State createState() => _SignUpScreen4State();
}

class _SignUpScreen4State extends State<SignUpScreen4> {
  @override
  Widget build(BuildContext context) {
    return SignUpScreenWidget(
      title: 'Add a Password',
      hintText: 'Enter password',
      isPasswordScreen: true,
      buttonTitle: 'Next',
      onPressed: () {

      },
    );
  }
}
