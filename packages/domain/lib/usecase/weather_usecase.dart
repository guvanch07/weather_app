import 'package:domain/models/forcast.dart';

import 'package:domain/repository/network_repository.dart';

import 'base_usecase.dart';

class WeatherUseCase implements UseCase<Future<Forecast>> {
  final INetworkRepository _repository;

  WeatherUseCase(this._repository);
  @override
  Future<Forecast> call() {
    return _repository.getForecastData();
  }

  @override
  void dispose() {
    _repository.dispose();
  }
}
