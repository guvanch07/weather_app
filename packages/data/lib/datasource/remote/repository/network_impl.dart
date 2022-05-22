import 'package:data/const/api_key.dart';
import 'package:data/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/models/weather_models.dart';
import 'package:domain/repository/network_repository.dart';

class NetworkRepository implements INetworkRepository {
  final ApiService _service;
  final CancelToken _cancelToken;

  NetworkRepository(this._service, this._cancelToken);

  @override
  void dispose() {}

  @override
  Future<Welcome> getNetworkData(String lon, String lat) {
    return _service
        .get(
          path: ApiHelpers.weatherUrl(lat, lon),
          cancelToken: _cancelToken,
        )
        .then((value) => Welcome.fromMap(value.data));
  }
}
