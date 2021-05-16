import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:xafe/app/budget/domain/usecases/create_budget_expense.dart';
import 'package:xafe/app/home/data/models/expense_model.dart';
import 'package:xafe/core/error/helpers/helpers.dart';
import 'package:xafe/src/utils/navigation/navigation.dart';

class AddABudgetExpenseViewmodel extends BaseViewModel {
  AddABudgetExpenseViewmodel(this._createBudgetExpense);

  final CreateBudgetExpense _createBudgetExpense;

  Future addABudgetExpense({
    ExpenseModel params,
    String budgetId,
    BuildContext context,
  }) {
    setBusy(true);
    return _createBudgetExpense(
      params: params,
      budgetId: budgetId,
    )..then(
        (result) {
          result.fold(
            (failure) {
              setBusy(false);
              Fluttertoast.showToast(
                msg: mapFailureMessage(failure),
              );
            },
            (data) {
              popView(context);
            },
          );
        },
      );
  }
}
