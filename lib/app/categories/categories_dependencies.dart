import 'package:xafe/app/categories/data/datasource/categories_datasource.dart';
import 'package:xafe/app/categories/data/datasource/impl/categories_datasource_impl.dart';
import 'package:xafe/app/categories/data/repository/categories_repo_impl.dart';
import 'package:xafe/app/categories/domain/repository/categories_repo.dart';
import 'package:xafe/app/categories/domain/usecases/create_category.dart';
import 'package:xafe/app/categories/domain/usecases/listen_to_categories.dart';
import 'package:xafe/core/config/di_config.dart';

import 'domain/usecases/delete_category.dart';

void registerCategoriesDIs() {
  //Use cases
  locator.registerLazySingleton(() => CreateCategory(locator()));
  locator.registerLazySingleton(() => ListenToCategories(locator()));
  locator.registerLazySingleton(() => DeleteCategory(locator()));

  //Repository
  locator.registerLazySingleton<CategoriesRepo>(
    () => CategoriesRepoImpl(
      locator(),
    ),
  );

  // Data sources
  locator.registerLazySingleton<CategoriesDataSource>(
    () => CategoriesDataSourceImpl(
      locator(),
    ),
  );
}
