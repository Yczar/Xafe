import 'package:flutter/material.dart';
import 'package:xafe/src/res/components/back_arrow/src/app_back_arrow.dart';
import 'package:xafe/src/res/components/buttons/src/xafe_button.dart';
import 'package:xafe/src/res/res.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

class SignUpScreenWidget extends StatefulWidget {
  const SignUpScreenWidget({
    Key key,
    this.title,
    this.buttonTitle,
    this.isPasswordScreen = false,
    this.hintText,
    this.onPressed,
    this.keyBoardType,
    this.controller,
    this.isBusy = false,
    this.showPasswordText,
    this.validator,
    this.obscureText = false,
    this.onShowPasswordPressed,
  }) : super(key: key);

  final String title;
  final String showPasswordText;
  final String hintText;
  final String buttonTitle;
  final bool isBusy;
  final bool obscureText;
  final bool isPasswordScreen;
  final FormFieldValidator<String> validator;

  final TextEditingController controller;
  final TextInputType keyBoardType;
  final VoidCallback onPressed;
  final VoidCallback onShowPasswordPressed;

  @override
  _SignUpScreenWidgetState createState() => _SignUpScreenWidgetState();
}

class _SignUpScreenWidgetState extends State<SignUpScreenWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: context.insetsSymetric(
              horizontal: 20,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const YMargin(66.45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      KAppBackArrow(),
                      const Text(
                        'Sign up',
                        style: TextStyle(
                          color: kColorAppBlack,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(),
                    ],
                  ),
                  const YMargin(60.45),
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: kColorAppBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: 38,
                    ),
                  ),
                  const YMargin(12),
                  TextFormField(
                    keyboardType: widget.keyBoardType,
                    controller: widget.controller,
                    validator: widget.validator,
                    obscureText: widget.obscureText,
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      filled: false,
                      isDense: true,
                      contentPadding: context.insetsAll(0),
                      hintText: widget.hintText,
                      hintStyle: const TextStyle(
                        color: kColorAppGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  YMargin(widget.isPasswordScreen ? 38 : 0),
                  widget.isPasswordScreen
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: widget.onShowPasswordPressed,
                            child: Container(
                              padding: context.insetsSymetric(
                                horizontal: 10,
                                vertical: 6.5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: kColorAltStroke,
                              ),
                              child: Text(
                                widget.showPasswordText,
                                style: const TextStyle(
                                  color: kColorAppBlack,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  YMargin(widget.isPasswordScreen ? 107.95 : 176.95),
                  Stack(
                    children: [
                      Container(
                        height: context.scaleY(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: kColorAltStroke,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Container(
                        height: context.scaleY(10),
                        width: context.scale(93.5),
                        decoration: const BoxDecoration(
                          color: kColorBlack,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const YMargin(20),
                  XafeButton(
                    text: widget.buttonTitle,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        widget.onPressed();
                      }
                    },
                    isLoading: widget.isBusy,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
