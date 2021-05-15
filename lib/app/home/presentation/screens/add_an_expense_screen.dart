import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';
import 'package:xafe/app/categories/data/model/category_model.dart';
import 'package:xafe/app/categories/domain/usecases/listen_to_categories.dart';
import 'package:xafe/app/home/data/models/expense_model.dart';
import 'package:xafe/app/home/presentation/logic/viewmodels/add_an_expense_viewmodel.dart';
import 'package:xafe/core/config/di_config.dart';
import 'package:xafe/src/res/components/buttons/src/xafe_button.dart';
import 'package:xafe/src/res/res.dart';
import 'package:xafe/src/utils/navigation/navigation.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

class AddAnExpenseScreen extends StatefulWidget {
  @override
  _AddAnExpenseScreenState createState() => _AddAnExpenseScreenState();
}

class _AddAnExpenseScreenState extends State<AddAnExpenseScreen> {
  ValueNotifier<CategoryModel> _selectedCategory;
  TextEditingController _expenseAmountEditingController;
  TextEditingController _expenseNameEditingController;

  @override
  void initState() {
    super.initState();
    _expenseAmountEditingController = TextEditingController(text: '');
    _expenseNameEditingController = TextEditingController(text: '');
    _selectedCategory = ValueNotifier(null);
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
              StreamBuilder<List<CategoryModel>>(
                stream: locator<ListenToCategories>().call(
                  uid: FirebaseAuth.instance.currentUser.uid,
                ),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.isNotEmpty) {
                      return ValueListenableBuilder(
                          valueListenable: _selectedCategory,
                          builder: (_, value, child) {
                            return Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                    keyboardType: TextInputType.number,
                                    controller: _expenseAmountEditingController,
                                    decoration: const InputDecoration(
                                      hintText: 'expense amount',
                                    ),
                                  ),
                                  const YMargin(10),
                                  DropdownButtonFormField(
                                    iconEnabledColor: kColorAppBlack,
                                    iconDisabledColor: kColorAppBlack,
                                    value: value as CategoryModel,
                                    onChanged: (value) {
                                      _selectedCategory.value =
                                          value as CategoryModel;
                                    },
                                    items: snapshot.data
                                        .map(
                                          (category) => DropdownMenuItem(
                                            child: Text(
                                              // ignore: lines_longer_than_80_chars
                                              '${category.categoryEmoji} ${category.categoryName}',
                                            ),
                                            value: category,
                                          ),
                                        )
                                        .toList(),
                                    decoration: const InputDecoration(
                                      hintText: 'Select category',
                                    ),
                                  ),
                                  const YMargin(10),
                                  TextFormField(
                                    controller: _expenseNameEditingController,
                                    decoration: const InputDecoration(
                                      hintText: 'expense name',
                                    ),
                                  ),
                                  const YMargin(10),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'date (dd/mm/yy)',
                                    ),
                                  ),
                                  const Spacer(),
                                  ViewModelBuilder<
                                          AddAnExpenseViewmodel>.reactive(
                                      viewModelBuilder: () =>
                                          AddAnExpenseViewmodel(
                                            locator(),
                                          ),
                                      builder: (_, model, __) {
                                        return XafeButton(
                                          isLoading: model.isBusy,
                                          onPressed: () {
                                            print((value as CategoryModel)
                                                .categoryEmoji);
                                            model.addAnExpense(
                                              context: context,
                                              params: ExpenseModel(
                                                expenseId: const Uuid().v4(),
                                                categoryEmoji:
                                                    (value as CategoryModel)
                                                        .categoryEmoji,
                                                categoryName:
                                                    (value as CategoryModel)
                                                        .categoryName,
                                                expenseAmount: int.parse(
                                                  // ignore: lines_longer_than_80_chars
                                                  _expenseAmountEditingController
                                                      .text,
                                                ),
                                                expenseDate: '',
                                                expenseName:
                                                    // ignore: lines_longer_than_80_chars
                                                    _expenseNameEditingController
                                                        .text,
                                              ),
                                            );
                                          },
                                          text: 'Add Expense',
                                        );
                                      }),
                                  const YMargin(80),
                                ],
                              ),
                            );
                          });
                    } else {
                      return const Expanded(
                        child: Center(
                          child: Text(
                            'No spending categories added yet',
                          ),
                        ),
                      );
                    }
                  } else if (snapshot.hasError) {
                    return Expanded(
                      child: Center(
                        child: Text(
                          'Error: ${snapshot.error}',
                        ),
                      ),
                    );
                  } else {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
