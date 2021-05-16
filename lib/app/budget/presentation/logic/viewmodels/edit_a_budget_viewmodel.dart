import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:xafe/app/budget/data/models/budget_model.dart';
import 'package:xafe/app/budget/domain/usecases/create_budget.dart';
import 'package:xafe/app/budget/domain/usecases/edit_budget.dart';
import 'package:xafe/core/error/helpers/helpers.dart';
import 'package:xafe/src/utils/navigation/navigation.dart';

class EditABudgetViewmodel extends BaseViewModel {
  EditABudgetViewmodel(this._editBudget);

  final EditBudget _editBudget;

  Future editBudget({
    BudgetModel params,
    BuildContext context,
  }) {
    setBusy(true);
    return _editBudget(params)
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
              setBusy(false);
              popView(context);
            },
          );
        },
      );
  }
}
