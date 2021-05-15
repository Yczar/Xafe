import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:xafe/app/authentication/authentication_dependencies.dart';
import 'package:xafe/core/network_checker/network_info.dart';

import 'firebase/services/auth_service.dart';
import 'firebase/services/cloud_storage_service.dart';
import 'firebase/services/firestore_service.dart';

GetIt locator = GetIt.I;
void setupLocator() {
  ///[Core]
  locator.registerLazySingleton(() => XafeAuthService());
  locator.registerLazySingleton(() => XafeFireStoreService());
  locator.registerLazySingleton(() => XafeCloudStorage());

  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));
  locator.registerLazySingleton(() => DataConnectionChecker());

  ///[src]

  ///[App]
  registerAuthenticationDIs();
}
