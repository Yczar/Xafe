import 'package:xafe/app/budget/data/models/budget_model.dart';
import 'package:xafe/app/home/data/models/expense_model.dart';

abstract class BudgetDataSource {
  Stream<List<BudgetModel>> listenToBudgets();

  Stream<List<ExpenseModel>> listenToBudgetExpenses(String budgetId);

  Future<void> createBudget(BudgetModel params);

  Future<void> createBudgetExpense(ExpenseModel params, String budgetId,);

  Future<void> deleteBudget(String budgetId);

  Future<void> editBudget(BudgetModel params);
}
