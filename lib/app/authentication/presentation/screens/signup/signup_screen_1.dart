import 'package:flutter/material.dart';
import 'package:xafe/app/authentication/data/models/user_model.dart';
import 'package:xafe/app/authentication/presentation/screens/signup/signup_screen_2.dart';
import 'package:xafe/app/authentication/presentation/widgets/sign_up_screen_widget.dart';
import 'package:xafe/src/utils/navigation/navigation.dart';

class SignUpScreen1 extends StatefulWidget {
  @override
  _SignUpScreen1State createState() => _SignUpScreen1State();
}

class _SignUpScreen1State extends State<SignUpScreen1> {
  TextEditingController _nameEditingController;

  @override
  void initState() {
    super.initState();
    _nameEditingController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _nameEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SignUpScreenWidget(
      title: 'What’s your name?',
      hintText: 'Enter your first name and last name',
      buttonTitle: 'Next',
      controller: _nameEditingController,
      onPressed: () {
        navigate(
          context,
          SignUpScreen2(
            userModel: UserModel(
              name: _nameEditingController.text,
            ),
          ),
        );
      },
    );
  }
}
