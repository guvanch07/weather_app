import 'package:domain/models/weather/weather.dart';

import 'package:domain/repository/network_repository.dart';

import 'base_usecase.dart';

class CurrentWeatherUseCase
    implements UseCaseParams<String, Future<CurrentWeather>> {
  final INetworkRepository _repository;

  CurrentWeatherUseCase(this._repository);
  @override
  Future<CurrentWeather> call(String city) async {
    return _repository.getCurrentData(city);
  }

  @override
  void dispose() {
    _repository.dispose();
  }
}
