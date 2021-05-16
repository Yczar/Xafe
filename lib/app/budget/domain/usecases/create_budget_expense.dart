import 'package:dartz/dartz.dart';
import 'package:xafe/app/budget/domain/repository/budget_repo.dart';
import 'package:xafe/app/home/data/models/expense_model.dart';
import 'package:xafe/core/error/failures.dart';

class CreateBudgetExpense {
  CreateBudgetExpense(this._repository);

  final BudgetRepo _repository;

  Future<Either<Failure, void>> call({
    ExpenseModel params,
    String budgetId,
  }) async =>
      await _repository.createBudgetExpense(
        params,
        budgetId,
      );
}
