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
    return _service
        .get(
          path: ApiHelpers.forecastWeatherUrl,
          cancelToken: _cancelToken,
        )
        .then((value) => Forecast.fromJson(value.data));
  }

  @override
  Future<CurrentWeather> getCurrentData(String city) async {
    return _service
        .get(
      path: ApiHelpers.currentWeatherUrl(city),
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
  Future<List<CityModel>> getCities() async {
    List<CityModel> list = [];
    //return _service.get(path: ApiHelpers.cityUrl).then((value) {
    list.add(CityModel.fromMap(
      {
        "id": 79,
        "name": "Kabul",
        "state_id": 3902,
        "state_code": "KAB",
        "state_name": "Kabul",
        "country_id": 1,
        "country_code": "AF",
        "country_name": "Afghanistan",
        "latitude": "34.52813000",
        "longitude": "69.17233000",
        "wikiDataId": "Q5838"
      },
    ));

    return list;
  }
}

//! for cheching also you can use mock, to fetch cities is taking more time because there are so more

// {
//         "id": 79,
//         "name": "Kabul",
//         "state_id": 3902,
//         "state_code": "KAB",
//         "state_name": "Kabul",
//         "country_id": 1,
//         "country_code": "AF",
//         "country_name": "Afghanistan",
//         "latitude": "34.52813000",
//         "longitude": "69.17233000",
//         "wikiDataId": "Q5838"
//       },
//  {
//         "id": 99,
//         "name": "Mīr Bachah Kōṯ",
//         "state_id": 3902,
//         "state_code": "KAB",
//         "state_name": "Kabul",
//         "country_id": 1,
//         "country_code": "AF",
//         "country_name": "Afghanistan",
//         "latitude": "34.74999000",
//         "longitude": "69.11899000",
//         "wikiDataId": "Q6872026"
//     },
//     {
//         "id": 103,
//         "name": "Paghmān",
//         "state_id": 3902,
//         "state_code": "KAB",
//         "state_name": "Kabul",
//         "country_id": 1,
//         "country_code": "AF",
//         "country_name": "Afghanistan",
//         "latitude": "34.58787000",
//         "longitude": "68.95091000",
//         "wikiDataId": "Q2502256"
//     },
//     {
//         "id": 81,
//         "name": "Kandahār",
//         "state_id": 3890,
//         "state_code": "KAN",
//         "state_name": "Kandahar",
//         "country_id": 1,
//         "country_code": "AF",
//         "country_name": "Afghanistan",
//         "latitude": "31.61332000",
//         "longitude": "65.71013000",
//         "wikiDataId": "Q45604"
//     },