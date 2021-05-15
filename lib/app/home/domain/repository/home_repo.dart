import 'package:dartz/dartz.dart';
import 'package:xafe/app/home/data/models/expense_model.dart';
import 'package:xafe/core/error/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, void>> addAnExpense(ExpenseModel params);

  Stream<List<ExpenseModel>> listenToExpenses();
}
