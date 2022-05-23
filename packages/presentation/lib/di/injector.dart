import 'package:get_it/get_it.dart';
import 'package:presentation/mapper/login_view_mapper.dart';
import 'package:presentation/mapper/time_date_mapper.dart';
import 'package:presentation/pages/home_page/bloc/bloc.dart';
import 'package:domain/usecase/weather_usecase.dart';

Future<void> injectPresentationModule() async {
  final sl = GetIt.I;

  sl.registerSingleton<LocationMapper>(LocationMapper());

  sl.registerFactory(
    () => HomeBloc(
      sl.get<WeatherUseCase>(),
      sl.get<LocationMapper>(),
    ),
  );
  sl.registerSingleton<WeatherMapper>(
    WeatherMapper(),
  );
}
