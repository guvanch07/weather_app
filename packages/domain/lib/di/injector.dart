import 'package:domain/repository/network_repository.dart';
import 'package:domain/usecase/weather_usecase.dart';
import 'package:get_it/get_it.dart';

Future<void> injectDomainModule() async {
  final sl = GetIt.I;

  sl.registerFactory<WeatherUseCase>(
    () => WeatherUseCase(
      sl.get<INetworkRepository>(),
    ),
  );
}
