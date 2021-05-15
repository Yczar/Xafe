import 'package:dartz/dartz.dart';
import 'package:xafe/app/home/data/models/expense_model.dart';
import 'package:xafe/app/home/domain/repository/home_repo.dart';
import 'package:xafe/core/error/failures.dart';

class AddAnExpense {
  AddAnExpense(this._repository);

  final HomeRepo _repository;

  Future<Either<Failure, void>> call(ExpenseModel params) async =>
      await _repository.addAnExpense(params);
}
