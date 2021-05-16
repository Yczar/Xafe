import 'package:dartz/dartz.dart';
import 'package:xafe/app/budget/data/models/budget_model.dart';
import 'package:xafe/app/budget/domain/repository/budget_repo.dart';
import 'package:xafe/core/error/failures.dart';

class CreateBudget {
  CreateBudget(this._repository);

  final BudgetRepo _repository;

  Future<Either<Failure, void>> call(BudgetModel params) async =>
      await _repository.createBudget(params);
}
