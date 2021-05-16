import 'package:dartz/dartz.dart';
import 'package:xafe/app/budget/data/datasource/budget_datasource.dart';
import 'package:xafe/app/budget/data/models/budget_model.dart';
import 'package:xafe/app/budget/domain/repository/budget_repo.dart';
import 'package:xafe/app/home/data/models/expense_model.dart';
import 'package:xafe/core/error/failures.dart';
import 'package:xafe/core/error/helpers/helpers.dart';

class BudgetRepoImpl implements BudgetRepo {
  BudgetRepoImpl(this._budgetDataSource);

  final BudgetDataSource _budgetDataSource;

  @override
  Future<Either<Failure, void>> createBudget(BudgetModel params) {
    return successFailureInterceptor(
      () => _budgetDataSource.createBudget(params),
    );
  }

  @override
  Future<Either<Failure, void>> createBudgetExpense(
    ExpenseModel params,
    String budgetId,
  ) {
    return successFailureInterceptor(
      () => _budgetDataSource.createBudgetExpense(
        params,
        budgetId,
      ),
    );
  }

  @override
  Future<Either<Failure, void>> deleteBudget(String budgetId) {
    return successFailureInterceptor(
      () => _budgetDataSource.deleteBudget(budgetId),
    );
  }

  @override
  Future<Either<Failure, void>> editBudget(BudgetModel params) {
    return successFailureInterceptor(
      () => _budgetDataSource.editBudget(params),
    );
  }

  @override
  Stream<List<ExpenseModel>> listenToBudgetExpenses(String budgetId) {
    return _budgetDataSource.listenToBudgetExpenses(budgetId);
  }

  @override
  Stream<List<BudgetModel>> listenToBudgets() {
    return _budgetDataSource.listenToBudgets();
  }
}
