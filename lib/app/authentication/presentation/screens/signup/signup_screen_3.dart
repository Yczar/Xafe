import 'package:flutter/material.dart';
import 'package:xafe/app/authentication/data/models/user_model.dart';
import 'package:xafe/app/authentication/presentation/screens/signup/signup_screen_4.dart';
import 'package:xafe/app/authentication/presentation/widgets/sign_up_screen_widget.dart';
import 'package:xafe/src/utils/navigation/navigation.dart';

class SignUpScreen3 extends StatefulWidget {
  const SignUpScreen3({
    Key key,
    this.userModel,
  }) : super(key: key);

  final UserModel userModel;
  @override
  _SignUpScreen3State createState() => _SignUpScreen3State();
}

class _SignUpScreen3State extends State<SignUpScreen3> {
  @override
  Widget build(BuildContext context) {
    return SignUpScreenWidget(
      title: 'Enter the code',
      hintText: 'Enter the code sent to your email address',
      buttonTitle: 'Next',
      keyBoardType: TextInputType.number,
      onPressed: () {
        navigate(
          context,
          SignUpScreen4(),
        );
      },
    );
  }
}
