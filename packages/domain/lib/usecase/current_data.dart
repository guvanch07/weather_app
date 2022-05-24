import 'package:domain/models/weather.dart';

import 'package:domain/repository/network_repository.dart';

import 'base_usecase.dart';

class CurrentWeatherUseCase implements UseCase<Future<CurrentWeather>> {
  final INetworkRepository _repository;

  CurrentWeatherUseCase(this._repository);
  @override
  Future<CurrentWeather> call() {
    return _repository.getCurrentData();
  }

  @override
  void dispose() {
    _repository.dispose();
  }
}
