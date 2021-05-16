import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';
import 'package:xafe/app/budget/data/models/budget_model.dart';
import 'package:xafe/app/budget/presentation/logic/viewmodels/create_a_budget_viewmodel.dart';
import 'package:xafe/core/config/di_config.dart';
import 'package:xafe/src/res/components/back_arrow/src/app_back_arrow.dart';
import 'package:xafe/src/res/components/buttons/src/xafe_button.dart';
import 'package:xafe/src/res/res.dart';
import 'package:xafe/src/utils/scaler/scaler.dart';

class CreateABudgetScreen extends StatefulWidget {
  @override
  _CreateABudgetScreenState createState() => _CreateABudgetScreenState();
}

class _CreateABudgetScreenState extends State<CreateABudgetScreen> {
  final ValueNotifier<String> _selectedBudgetInterval = ValueNotifier(null);
  TextEditingController _budgetNameEditingController;
  TextEditingController _budgetAmountEditingController;
  final List<String> _budgetIntervals = [
    'Daily',
    'Weekly',
    'Monthly',
    'Yearly',
  ];

  @override
  void initState() {
    super.initState();
    _budgetNameEditingController = TextEditingController(text: '');
    _budgetAmountEditingController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _budgetNameEditingController.dispose();
    _budgetAmountEditingController.dispose();
    super.dispose();
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
                controller: _budgetNameEditingController,
                decoration: const InputDecoration(
                  hintText: 'Budget name',
                ),
              ),
              const YMargin(10),
              TextFormField(
                controller: _budgetAmountEditingController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Budget amount',
                ),
              ),
              const YMargin(10),
              ValueListenableBuilder(
                  valueListenable: _selectedBudgetInterval,
                  builder: (_, value, __) {
                    return DropdownButtonFormField(
                      iconEnabledColor: kColorAppBlack,
                      value: value,
                      iconDisabledColor: kColorAppBlack,
                      onChanged: (value) {
                        _selectedBudgetInterval.value = value;
                      },
                      items: _budgetIntervals.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                          ),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        hintText: 'Choose interval',
                      ),
                    );
                  }),
              const Spacer(),
              ViewModelBuilder<CreateABudgetViewmodel>.reactive(
                  viewModelBuilder: () => CreateABudgetViewmodel(
                        locator(),
                      ),
                  builder: (_, model, __) {
                    return XafeButton(
                      isLoading: model.isBusy,
                      onPressed: () {
                        model.createBudget(
                          context: context,
                          params: BudgetModel(
                            budgetAmount: _budgetAmountEditingController.text,
                            budgetId: const Uuid().v4(),
                            budgetInterval: _selectedBudgetInterval.value,
                            budgetName: _budgetNameEditingController.text,
                          ),
                        );
                      },
                      text: 'Create Budget',
                    );
                  }),
              const YMargin(80),
            ],
          ),
        ),
      ),
    );
  }
}
