import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';
import 'package:xafe/app/categories/data/model/category_model.dart';
import 'package:xafe/app/categories/presentation/logic/viewmodels/create_category_viewmodel.dart';
import 'package:xafe/core/config/di_config.dart';
import 'package:xafe/src/res/components/back_arrow/src/app_back_arrow.dart';
import 'package:xafe/src/res/components/buttons/src/xafe_button.dart';
import 'package:xafe/src/res/res.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

class AddSpendingCategoryScreen extends StatefulWidget {
  @override
  _AddSpendingCategoryScreenState createState() =>
      _AddSpendingCategoryScreenState();
}

class _AddSpendingCategoryScreenState extends State<AddSpendingCategoryScreen> {
  final _categoryEmojis = [
    '🍖',
    '✈️',
    '🤵‍♂️',
    '🛒',
    '🏥',
    '🏡',
    '🎥',
  ];
  final ValueNotifier<String> _currentSelectedValue = ValueNotifier(null);
  TextEditingController _categoryNameController;
  TextEditingController _categoryEmojiController;

  @override
  void initState() {
    super.initState();
    _categoryNameController = TextEditingController(
      text: '',
    );
    _categoryEmojiController = TextEditingController(
      text: '',
    );
  }

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
            KAppBackArrow(),
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
              controller: _categoryNameController,
            ),
            const YMargin(10),
            ValueListenableBuilder(
                valueListenable: _currentSelectedValue,
                builder: (_, value, child) {
                  return DropdownButtonFormField(
                    iconEnabledColor: kColorAppBlack,
                    iconDisabledColor: kColorAppBlack,
                    value: value,
                    onChanged: (value) {
                      _currentSelectedValue.value = value;
                    },
                    items: _categoryEmojis.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      hintText: 'Choose category emoji',
                    ),
                  );
                }),
            const Spacer(),
            ViewModelBuilder<CreateCategoryViewmodel>.reactive(
                viewModelBuilder: () => CreateCategoryViewmodel(locator()),
                builder: (_, model, __) {
                  return XafeButton(
                    isLoading: model.isBusy,
                    onPressed: () {
                      model.createCategory(
                        params: CategoryModel(
                          categoryId: const Uuid().v4(),
                          categoryName: _categoryNameController.text,
                          categoryEmoji: _currentSelectedValue.value,
                        ),
                        context: context,
                      );
                    },
                    text: 'Create Category',
                  );
                }),
            const YMargin(80),
          ],
        ),
      ),
    );
  }
}
