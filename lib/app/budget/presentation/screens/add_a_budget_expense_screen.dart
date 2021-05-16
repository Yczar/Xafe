import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';
import 'package:xafe/app/budget/presentation/logic/viewmodels/add_a_budget_expense_viewmodel.dart';
import 'package:xafe/app/categories/data/model/category_model.dart';
import 'package:xafe/app/categories/domain/usecases/listen_to_categories.dart';
import 'package:xafe/app/home/data/models/expense_model.dart';
import 'package:xafe/core/config/di_config.dart';
import 'package:xafe/src/res/components/back_arrow/src/app_back_arrow.dart';
import 'package:xafe/src/res/components/buttons/src/xafe_button.dart';
import 'package:xafe/src/res/components/forms/helpers/validator_helper.dart';
import 'package:xafe/src/res/res.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

class AddABudgetExpenseScreen extends StatefulWidget {
  const AddABudgetExpenseScreen({
    Key key,
    this.budgetId,
  }) : super(key: key);

  final String budgetId;

  @override
  _AddABudgetExpenseScreenState createState() => _AddABudgetExpenseScreenState();
}

class _AddABudgetExpenseScreenState extends State<AddABudgetExpenseScreen> {
  ValueNotifier<DateTime> selectedDate = ValueNotifier(null);
  final GlobalKey<FormState> _formKey = GlobalKey();
  ValueNotifier<CategoryModel> _selectedCategory;
  TextEditingController _expenseAmountEditingController;
  TextEditingController _expenseNameEditingController;
  TextEditingController _expenseDateEditingController;

  @override
  void initState() {
    super.initState();
    _expenseAmountEditingController = TextEditingController(text: '');
    _expenseNameEditingController = TextEditingController(text: '');
    _expenseDateEditingController = TextEditingController(text: '');
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
              KAppBackArrow(),
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
                              child: Form(
                                key: _formKey,
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
                                      validator: (value) {
                                        return XafeFormFieldValidator
                                            .defaultValidator(value);
                                      },
                                      controller:
                                          _expenseAmountEditingController,
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
                                      validator: (value) {
                                        return XafeFormFieldValidator
                                            .defaultValidator(value);
                                      },
                                      decoration: const InputDecoration(
                                        hintText: 'expense name',
                                      ),
                                    ),
                                    const YMargin(10),
                                    ValueListenableBuilder(
                                        valueListenable: selectedDate,
                                        builder: (_, value, __) {
                                          return InkWell(
                                            onTap: () async {
                                              final DateTime picked =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate: value ??
                                                          DateTime.now(),
                                                      firstDate:
                                                          DateTime(2015, 8),
                                                      lastDate: DateTime(2101));
                                              if (picked != null &&
                                                  // ignore: unrelated_type_equality_checks
                                                  picked != selectedDate) {
                                                selectedDate.value = picked;
                                              }
                                            },
                                            child: TextFormField(
                                              controller:
                                                  _expenseDateEditingController,
                                              decoration: InputDecoration(
                                                  hintText: 'date (dd/mm/yy)',
                                                  labelStyle: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    color: kColorBlackish,
                                                  ),
                                                  labelText: value == null
                                                      ? value
                                                      // ignore: lines_longer_than_80_chars
                                                      : 'date(${DateFormat('dd/MM/yy').format(value)})'),
                                              enabled: false,
                                            ),
                                          );
                                        }),
                                    const Spacer(),
                                    ViewModelBuilder<
                                            AddABudgetExpenseViewmodel>.reactive(
                                        viewModelBuilder: () =>
                                            AddABudgetExpenseViewmodel(
                                              locator(),
                                            ),
                                        builder: (_, model, __) {
                                          return XafeButton(
                                            isLoading: model.isBusy,
                                            onPressed: () {
                                              if (_formKey.currentState
                                                  .validate()) {
                                                if (selectedDate.value !=
                                                    null) {
                                                  model.addABudgetExpense(
                                                    context: context,
                                                    budgetId: widget.budgetId,
                                                    params: ExpenseModel(
                                                      expenseId:
                                                          const Uuid().v4(),
                                                      categoryEmoji: (value
                                                              as CategoryModel)
                                                          .categoryEmoji,
                                                      categoryName: (value
                                                              as CategoryModel)
                                                          .categoryName,
                                                      expenseAmount: int.parse(
                                                        // ignore: lines_longer_than_80_chars
                                                        _expenseAmountEditingController
                                                            .text,
                                                      ),
                                                      expenseDate: DateFormat('dd/MM/yy').format(selectedDate.value),
                                                      expenseName:
                                                          // ignore: lines_longer_than_80_chars
                                                          _expenseNameEditingController
                                                              .text,
                                                    ),
                                                  );
                                                } else {
                                                  Fluttertoast.showToast(
                                                    msg:
                                                        // ignore: lines_longer_than_80_chars
                                                        'Please select an expense date',
                                                  );
                                                }
                                              }
                                            },
                                            text: 'Add Expense',
                                          );
                                        }),
                                    const YMargin(80),
                                  ],
                                ),
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
