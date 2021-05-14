import 'package:flutter/material.dart';
import 'package:xafe/src/res/components/buttons/src/xafe_button.dart';
import 'package:xafe/src/res/res.dart';
import 'package:xafe/src/utils/navigation/navigation.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

class AddAnExpenseScreen extends StatefulWidget {
  @override
  _AddAnExpenseScreenState createState() => _AddAnExpenseScreenState();
}

class _AddAnExpenseScreenState extends State<AddAnExpenseScreen> {
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
              InkWell(
                onTap: () {
                  popView(context);
                },
                child: Icon(
                  Icons.chevron_left,
                  color: kColorBlackish,
                  size: context.scaleY(19),
                ),
              ),
              const YMargin(60.45),
              const Text(
                'Add an expense',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: kColorAppBlack,
                ),
              ),
              const YMargin(35),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'expense amount',
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
                  hintText: 'Select category',
                ),
              ),
              const YMargin(10),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'expense name',
                ),
              ),
              const YMargin(10),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'date (dd/mm/yy)',
                ),
              ), const Spacer(),
              XafeButton(
                onPressed: () {},
                text: 'Create Category',
              ),
              const YMargin(80),
            ],
          ),
        ),
      ),
    );
  }
}
