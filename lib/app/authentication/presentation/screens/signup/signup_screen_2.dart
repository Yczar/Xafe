import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xafe/app/authentication/data/models/user_model.dart';
import 'package:xafe/app/authentication/presentation/logic/viewmodels/send_email_viewmodel.dart';
import 'package:xafe/app/authentication/presentation/screens/signup/signup_screen_3.dart';
import 'package:xafe/app/authentication/presentation/widgets/sign_up_screen_widget.dart';
import 'package:xafe/src/utils/navigation/navigation.dart';

class SignUpScreen2 extends StatefulWidget {
  const SignUpScreen2({
    Key key,
    this.userModel,
  }) : super(key: key);

  final UserModel userModel;

  @override
  _SignUpScreen2State createState() => _SignUpScreen2State();
}

class _SignUpScreen2State extends State<SignUpScreen2> {
  TextEditingController _emailEditingController;

  @override
  void initState() {
    super.initState();
    _emailEditingController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _emailEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SendEmailViewModel>.reactive(
      viewModelBuilder: ()=>SendEmailViewModel(),
      builder: (_, model, __) {
        return SignUpScreenWidget(
          title: 'What’s your email?',
          hintText: 'Enter your email address',
          buttonTitle: 'Next',
          controller: _emailEditingController,
          onPressed: () {
           model.sendEmail()
          },
        );
      }
    );
  }
}
