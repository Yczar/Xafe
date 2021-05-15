import 'package:xafe/core/config/di_config.dart';

import 'data/datasource/authentication_data_source.dart';
import 'data/datasource/impl/authentication_data_source_impl.dart';
import 'data/repository/authentication_repo_impl.dart';
import 'domain/repository/authentication_repo.dart';
import 'domain/usecases/create_user.dart';
import 'domain/usecases/get_user.dart';
import 'domain/usecases/login_user.dart';
import 'domain/usecases/register_user.dart';

void registerAuthenticationDIs() {
  //Use cases
  locator.registerLazySingleton(() => LoginUser(locator()));
  locator.registerLazySingleton(() => RegisterUser(locator()));
  locator.registerLazySingleton(() => CreateUser(locator()));
  locator.registerLazySingleton(() => GetUser(locator()));

  //Repository
  locator.registerLazySingleton<AuthenticationRepo>(
    () => AuthenticationRepoImpl(
      authenticationDataSource: locator(),
    ),
  );

  // Data sources
  locator.registerLazySingleton<AuthenticationDataSource>(
    () => AuthenticationDataSourceImpl(locator(), locator()),
  );
}
