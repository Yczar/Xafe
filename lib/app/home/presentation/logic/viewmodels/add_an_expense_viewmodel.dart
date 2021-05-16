import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:xafe/app/home/data/models/expense_model.dart';
import 'package:xafe/app/home/domain/usecases/add_an_expense.dart';
import 'package:xafe/core/error/helpers/helpers.dart';
import 'package:xafe/src/utils/navigation/navigation.dart';

class AddAnExpenseViewmodel extends BaseViewModel {
  AddAnExpenseViewmodel(this._addAnExpense);

  final AddAnExpense _addAnExpense;

  Future addAnExpense({
    ExpenseModel params,
    BuildContext context,
  }) {
    setBusy(true);
    return _addAnExpense(params)
      ..then(
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
