import 'dart:developer';

import 'package:data/const/api_key.dart';
import 'package:data/datasource/local/init/init_hive.dart';
import 'package:data/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/models/city_model.dart';
import 'package:domain/models/forcast.dart';
import 'package:domain/models/weather/weather.dart';
import 'package:domain/repository/network_repository.dart';

class NetworkRepository implements INetworkRepository {
  final ApiService _service;
  final CancelToken _cancelToken;

  NetworkRepository(this._service, this._cancelToken);

  @override
  void dispose() {}

  @override
  Future<Forecast> getForecastData() async {
    log(ApiHelpers.baseUrl + ApiHelpers.forecastWeatherUrl);
    return _service
        .get(
          path: ApiHelpers.baseUrl + ApiHelpers.forecastWeatherUrl,
          cancelToken: _cancelToken,
        )
        .then((value) => Forecast.fromJson(value.data));
  }

  @override
  Future<CurrentWeather> getCurrentData(String city) async {
    log(ApiHelpers.baseUrl + ApiHelpers.currentWeatherUrl(city));
    return _service
        .get(
      path: ApiHelpers.baseUrl + ApiHelpers.currentWeatherUrl(city),
      cancelToken: _cancelToken,
    )
        .then((value) {
      final getLocally = HiveHelpers.testBox.get(HiveKeys.testKey);
      if (getLocally != null) return getLocally;
      final remoteData = CurrentWeather.fromJson(value.data);
      HiveHelpers.testBox.put(HiveKeys.testKey, remoteData);
      return remoteData;
    });
  }

  @override
  Future<List<City>> getCities(String query) async {
    if (query == '') return [];
    final path = ApiHelpers.citySearchBaseURL +
        query +
        ApiHelpers.limitRequestKey +
        ApiHelpers.apiKey;
    log(path);
    final request = await _service.get(path: path);
    final data = request.data as List<dynamic>;
    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => City.fromMap(e)).toList();
    }
  }
}
