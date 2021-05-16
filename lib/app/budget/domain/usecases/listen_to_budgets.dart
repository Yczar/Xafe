import 'package:xafe/app/budget/data/models/budget_model.dart';
import 'package:xafe/app/budget/domain/repository/budget_repo.dart';

class ListenToBudgets {
  ListenToBudgets(this._repo);

  final BudgetRepo _repo;

  Stream<List<BudgetModel>> call() => _repo.listenToBudgets();
}
