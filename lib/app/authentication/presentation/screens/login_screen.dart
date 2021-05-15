import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:xafe/app/authentication/domain/params/post_params/post_params.dart';
import 'package:xafe/app/authentication/presentation/logic/viewmodels/login_viewmodel.dart';
import 'package:xafe/core/config/di_config.dart';
import 'package:xafe/src/res/components/back_arrow/src/app_back_arrow.dart';
import 'package:xafe/src/res/components/buttons/src/xafe_button.dart';
import 'package:xafe/src/res/components/forms/helpers/validator_helper.dart';
import 'package:xafe/src/res/res.dart';
import 'package:xafe/src/res/values/assets/svgs/svgs.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailEditingController;
  TextEditingController _passwordEditingController;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final ValueNotifier<bool> _isObscure = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _emailEditingController = TextEditingController(
      text: '',
    );
    _passwordEditingController = TextEditingController(
      text: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: context.insetsSymetric(
            horizontal: 20.0,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const YMargin(66.45),
                KAppBackArrow(),
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
                  controller: _emailEditingController,
                  validator: (value) {
                    return XafeFormFieldValidator.emailValidator(value);
                  },
                  decoration: const InputDecoration(
                    hintText: 'email address',
                  ),
                ),
                const YMargin(10),
                ValueListenableBuilder(
                    valueListenable: _isObscure,
                    builder: (_, value, child) {
                      return TextFormField(
                        controller: _passwordEditingController,
                        validator: (value) {
                          return XafeFormFieldValidator.defaultValidator(value);
                        },
                        obscureText: value,
                        decoration: InputDecoration(
                          hintText: '• • • • • • • • • • ',
                          suffixIcon: UnconstrainedBox(
                            child: InkWell(
                              onTap: () {
                                _isObscure.value = !_isObscure.value;
                              },
                              child: SvgPicture.asset(
                                kPasswordVisibilityIcon,
                                height: context.scaleY(12.17),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
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
                ViewModelBuilder<LoginViewmodel>.reactive(
                    viewModelBuilder: () => LoginViewmodel(
                          locator(),
                        ),
                    builder: (_, model, __) {
                      return XafeButton(
                        text: 'Login',
                        isLoading: model.isBusy,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            model.loginUser(
                              context: context,
                              params: EmailPasswordParams(
                                password: _passwordEditingController.text,
                                email: _emailEditingController.text,
                              ),
                            );
                          }
                        },
                      );
                    }),
                const YMargin(80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
