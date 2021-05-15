import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xafe/src/res/components/buttons/src/xafe_button.dart';
import 'package:xafe/src/res/res.dart';
import 'package:xafe/src/utils/navigation/navigation.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

class AddSpendingCategoryScreen extends StatefulWidget {
  @override
  _AddSpendingCategoryScreenState createState() =>
      _AddSpendingCategoryScreenState();
}

class _AddSpendingCategoryScreenState extends State<AddSpendingCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: context.insetsSymetric(
          horizontal: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const YMargin(66.45),
            InkWell(
              onTap: (){
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
              '‍Add a spending category',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 24,
                color: kColorAppBlack,
              ),
            ),
            const YMargin(35),
            TextFormField(
              decoration:
                  const InputDecoration(hintText: 'Enter category name'),
            ),
            const YMargin(10),
            DropdownButtonFormField(
              iconEnabledColor: kColorAppBlack,
              iconDisabledColor: kColorAppBlack,
              items: [
                const DropdownMenuItem(
                  child: Text('Hello'),
                ),
                  const DropdownMenuItem(
                  child: Text('Hallo'),
                ),

              ],
              decoration: const InputDecoration(
                hintText: 'Choose category emoji',
              ),
            ),
            const Spacer(),
            ViewModelBuilder.reactive(
              viewModelBuilder: ()=>null,
              builder: (_, model, __) {
                return XafeButton(
                  onPressed: () {},
                  text: 'Create Category',
                );
              }
            ),
            const YMargin(80),
          ],
        ),
      ),
    );
  }
}
