import 'package:domain/models/forcast.dart';
import 'package:domain/models/weather.dart';
import 'package:domain/repository/base_repository.dart';

abstract class INetworkRepository implements BaseRepository {
  Future<Forecast> getForecastData();
  Future<Weather> getCurrentData();
}
