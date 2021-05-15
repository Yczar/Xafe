import 'package:xafe/app/home/data/datasource/home_datasource.dart';
import 'package:xafe/app/home/data/datasource/impl/home_datasource_impl.dart';
import 'package:xafe/app/home/data/repository/home_repo_impl.dart';
import 'package:xafe/app/home/domain/repository/home_repo.dart';
import 'package:xafe/app/home/domain/usecases/add_an_expense.dart';
import 'package:xafe/app/home/domain/usecases/listen_to_expenses.dart';
import 'package:xafe/core/config/di_config.dart';

void registerHomeDIs() {
  //Use cases
  locator.registerLazySingleton(() => AddAnExpense(locator()));
  locator.registerLazySingleton(() => ListenToExpenses(locator()));

  //Repository
  locator.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(
      locator(),
    ),
  );

  // Data sources
  locator.registerLazySingleton<HomeDataSource>(
    () => HomeDataSourceImpl(
      locator(),
    ),
  );
}
