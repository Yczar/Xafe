import 'package:xafe/app/budget/domain/repository/budget_repo.dart';
import 'package:xafe/app/home/data/models/expense_model.dart';

class ListenToBudgetExpenses {
  ListenToBudgetExpenses(this._repo);

  final BudgetRepo _repo;

  Stream<List<ExpenseModel>> call(String budgetId) =>
      _repo.listenToBudgetExpenses(budgetId);
}
