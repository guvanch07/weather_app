import 'package:domain/models/forcast.dart';

import 'package:domain/repository/network_repository.dart';

import 'base_usecase.dart';

class ForecastWeatherUseCase implements UseCase<Future<Forecast>> {
  final INetworkRepository _repository;

  ForecastWeatherUseCase(this._repository);
  @override
  Future<Forecast> call() {
    return _repository.getForecastData();
  }

  @override
  void dispose() {
    _repository.dispose();
  }
}
