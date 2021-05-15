import 'package:xafe/app/home/data/models/expense_model.dart';
import 'package:xafe/app/home/domain/repository/home_repo.dart';

class ListenToExpenses {
  ListenToExpenses(this._repo);

  final HomeRepo _repo;

  Stream<List<ExpenseModel>> call() => _repo.listenToExpenses();
}
