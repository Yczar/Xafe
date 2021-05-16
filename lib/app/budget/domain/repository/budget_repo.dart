import 'package:dartz/dartz.dart';
import 'package:xafe/app/budget/data/models/budget_model.dart';
import 'package:xafe/app/home/data/models/expense_model.dart';
import 'package:xafe/core/error/failures.dart';

abstract class BudgetRepo {
  Stream<List<BudgetModel>> listenToBudgets();

  Stream<List<ExpenseModel>> listenToBudgetExpenses(String budgetId);

  Future<Either<Failure, void>> createBudget(BudgetModel params);

  Future<Either<Failure, void>> createBudgetExpense(
    ExpenseModel params,
    String budgetId,
  );

  Future<Either<Failure, void>> deleteBudget(String budgetId);

  Future<Either<Failure, void>> editBudget(BudgetModel params);
}
