import 'package:flutter/material.dart';
import 'package:xafe/src/res/components/back_arrow/src/app_back_arrow.dart';
import 'package:xafe/src/res/components/buttons/src/xafe_button.dart';
import 'package:xafe/src/res/res.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

class CreateABudgetScreen extends StatefulWidget {
  @override
  _CreateABudgetScreenState createState() => _CreateABudgetScreenState();
}

class _CreateABudgetScreenState extends State<CreateABudgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: context.insetsSymetric(
            horizontal: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const YMargin(66.45),
              KAppBackArrow(),
              const YMargin(60.45),
              const Text(
                'Create a budget',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: kColorAppBlack,
                ),
              ),
              const YMargin(35),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Budget name',
                ),
              ),
              const YMargin(10),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Budget amount',
                ),
              ),
              const YMargin(10),
              DropdownButtonFormField(
                iconEnabledColor: kColorAppBlack,
                iconDisabledColor: kColorAppBlack,
                items: [
                  const DropdownMenuItem(
                    child: Text('Hello'),
                  ),
                ],
                decoration: const InputDecoration(
                  hintText: 'Choose interval',
                ),
              ),
              const Spacer(),
              XafeButton(
                onPressed: () {},
                text: 'Create Budget',
              ),
              const YMargin(80),
            ],
          ),
        ),
      ),
    );
  }
}
