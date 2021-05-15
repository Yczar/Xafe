import 'package:xafe/app/home/data/models/expense_model.dart';

abstract class HomeDataSource {
  Future<void> addAnExpense(ExpenseModel params);

  Stream<List<ExpenseModel>> listenToExpenses();
}
