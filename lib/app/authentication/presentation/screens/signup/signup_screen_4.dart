import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xafe/app/authentication/data/models/user_model.dart';
import 'package:xafe/app/authentication/domain/params/post_params/post_params.dart';
import 'package:xafe/app/authentication/presentation/logic/viewmodels/signup_viewmodel.dart';
import 'package:xafe/app/authentication/presentation/widgets/sign_up_screen_widget.dart';
import 'package:xafe/core/config/di_config.dart';

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
  TextEditingController _passwordEditingController;
  final ValueNotifier<bool> _isObscure = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _passwordEditingController = TextEditingController(
      text: '',
    );
  }

  @override
  void dispose() {
    _passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewmodel>.reactive(
        viewModelBuilder: () => SignUpViewmodel(
              locator(),
              locator(),
            ),
        builder: (_, model, __) {
          return ValueListenableBuilder(
              valueListenable: _isObscure,
              builder: (_, value, __) {
                return SignUpScreenWidget(
                  title: 'Add a Password',
                  hintText: 'Enter password',
                  isPasswordScreen: true,
                  showPasswordText: value ? 'show password' : 'hide password',
                  obscureText: value,
                  controller: _passwordEditingController,
                  buttonTitle: 'Next',
                  isBusy: model.isBusy,
                  onShowPasswordPressed: () {
                    _isObscure.value = !_isObscure.value;
                  },
                  onPressed: () {
                    model.registerUser(
                      context: context,
                      emailPasswordParams: EmailPasswordParams(
                        email: widget.userModel.email,
                        password: _passwordEditingController.text,
                      ),
                      params: widget.userModel,
                    );
                  },
                );
              });
        });
  }
}
