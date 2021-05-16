import 'package:dartz/dartz.dart';
import 'package:xafe/app/budget/domain/repository/budget_repo.dart';
import 'package:xafe/core/error/failures.dart';

class DeleteBudget {
  DeleteBudget(this._repository);

  final BudgetRepo _repository;

  Future<Either<Failure, void>> call(String budgetId) async =>
      await _repository.deleteBudget(budgetId);
}
