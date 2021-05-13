import 'package:flutter/material.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

class SignUpScreen1 extends StatefulWidget {
  @override
  _SignUpScreen1State createState() => _SignUpScreen1State();
}

class _SignUpScreen1State extends State<SignUpScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const YMargin(66.45),
              Row(
                children: [
                  Icon(
                    Icons.chevron_left,
                    size: context.scaleY(19),
                  ),
                  const Text('Sign up'),
                  const SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
