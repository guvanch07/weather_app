import 'package:data/const/api_key.dart';
import 'package:data/datasource/remote/repository/network_impl.dart';
import 'package:data/dio/dio_buildaer.dart';
import 'package:data/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/repository/network_repository.dart';

import 'package:get_it/get_it.dart';

Future<void> injectDataModule() async {
  final sl = GetIt.I;

  //! interceptors

  sl.registerFactory<CancelToken>(
    () => CancelToken(),
  );

  sl.registerFactory<LogInterceptor>(
    () => LogInterceptor(requestBody: true, responseBody: true),
  );

  //! repositories

  sl.registerSingleton<INetworkRepository>(
    NetworkRepository(
      sl.get<ApiService>(),
      sl.get<CancelToken>(),
    ),
  );

  //! services

  sl.registerLazySingleton<Dio>(
    () => dioBuilder(
      ApiHelpers.baseUrl,
      [
        sl.get<LogInterceptor>(),
      ],
    ),
  );

  sl.registerSingleton<ApiService>(
    ApiService(
      sl.get<Dio>(),
    ),
  );

  //! database

  // sl.registerSingletonAsync<Database>(
  //   () => LocalDBInit(
  //           nameDB: ApiHelperCore.nameDB, version: ApiHelperCore.version)
  //       .db,
  // );

//   sl.registerSingletonWithDependencies<ILocalDBRepository>(
//       () => LocalDBRepository(
//             sl.get<Database>(),
//           ),
//       dependsOn: [Database]);
}
