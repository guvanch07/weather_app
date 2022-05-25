import 'package:domain/repository/network_repository.dart';
import 'package:domain/usecase/cities_usecase.dart';
import 'package:domain/usecase/current_data.dart';
import 'package:domain/usecase/weather_usecase.dart';
import 'package:get_it/get_it.dart';

Future<void> injectDomainModule() async {
  final sl = GetIt.I;

  sl.registerFactory<ForecastWeatherUseCase>(
    () => ForecastWeatherUseCase(
      sl.get<INetworkRepository>(),
    ),
  );
  sl.registerFactory<CurrentWeatherUseCase>(
    () => CurrentWeatherUseCase(
      sl.get<INetworkRepository>(),
    ),
  );

  sl.registerFactory<CitiesUseCase>(
    () => CitiesUseCase(
      sl.get<INetworkRepository>(),
    ),
  );
}
