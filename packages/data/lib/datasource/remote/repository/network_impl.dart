import 'package:data/const/api_key.dart';
import 'package:data/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/models/forcast.dart';
import 'package:domain/models/weather.dart';
import 'package:domain/repository/network_repository.dart';

class NetworkRepository implements INetworkRepository {
  final ApiService _service;
  final CancelToken _cancelToken;

  NetworkRepository(this._service, this._cancelToken);

  @override
  void dispose() {}

  @override
  Future<Forecast> getForecastData() {
    return _service
        .get(
          path: ApiHelpers.forecastWeatherUrl,
          cancelToken: _cancelToken,
        )
        .then((value) => Forecast.fromJson(value.data));
  }

  @override
  Future<CurrentWeather> getCurrentData() {
    return _service
        .get(
          path: ApiHelpers.currentWeatherUrl,
          cancelToken: _cancelToken,
        )
        .then(
          (value) => CurrentWeather.fromJson(value.data),
        );
  }
}
