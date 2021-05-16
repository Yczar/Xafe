import 'package:xafe/app/budget/data/datasource/budget_datasource.dart';
import 'package:xafe/app/budget/data/datasource/impl/budget_datasource_impl.dart';
import 'package:xafe/app/budget/data/repository/budget_repo_impl.dart';
import 'package:xafe/app/budget/domain/repository/budget_repo.dart';
import 'package:xafe/app/budget/domain/usecases/create_budget.dart';
import 'package:xafe/app/budget/domain/usecases/create_budget_expense.dart';
import 'package:xafe/app/budget/domain/usecases/delete_budget.dart';
import 'package:xafe/app/budget/domain/usecases/edit_budget.dart';
import 'package:xafe/app/budget/domain/usecases/listen_to_budgets.dart';
import 'package:xafe/core/config/di_config.dart';

import 'domain/usecases/listen_to_budget_expenses.dart';

void registerBudgetsDIs() {
  //Use cases
  locator.registerLazySingleton(() => CreateBudget(locator()));
  locator.registerLazySingleton(() => CreateBudgetExpense(locator()));
  locator.registerLazySingleton(() => DeleteBudget(locator()));
  locator.registerLazySingleton(() => EditBudget(locator()));
  locator.registerLazySingleton(() => ListenToBudgets(locator()));
  locator.registerLazySingleton(() => ListenToBudgetExpenses(locator()));

  //Repository
  locator.registerLazySingleton<BudgetRepo>(
    () => BudgetRepoImpl(
      locator(),
    ),
  );

  // Data sources
  locator.registerLazySingleton<BudgetDataSource>(
    () => BudgetDataSourceImpl(
      locator(),
    ),
  );
}
