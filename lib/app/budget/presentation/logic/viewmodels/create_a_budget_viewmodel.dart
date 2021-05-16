import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:xafe/app/budget/data/models/budget_model.dart';
import 'package:xafe/app/budget/domain/usecases/create_budget.dart';
import 'package:xafe/core/error/helpers/helpers.dart';
import 'package:xafe/src/utils/navigation/navigation.dart';

class CreateABudgetViewmodel extends BaseViewModel {
  CreateABudgetViewmodel(this._createBudget);

  final CreateBudget _createBudget;

  Future createBudget({
    BudgetModel params,
    BuildContext context,
  }) {
    setBusy(true);
    return _createBudget(params)
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
