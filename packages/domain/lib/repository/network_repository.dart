import 'package:domain/models/city_model.dart';
import 'package:domain/models/forcast.dart';
import 'package:domain/models/weather/weather.dart';
import 'package:domain/repository/base_repository.dart';

abstract class INetworkRepository implements BaseRepository {
  Future<Forecast> getForecastData();
  Future<CurrentWeather> getCurrentData(String city);
  Future<List<City>> getCities(String city);
}
