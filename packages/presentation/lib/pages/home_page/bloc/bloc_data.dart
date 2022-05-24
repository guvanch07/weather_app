import 'package:domain/models/forcast.dart';
import 'package:domain/models/weather.dart';

class HomeData {
  Forecast? forecast;
  CurrentWeather? current;
  String lon = '';
  String lat = '';
  String city = '';
  String country = '';

  HomeData(
      this.forecast, this.lon, this.lat, this.city, this.country, this.current);

  factory HomeData.init() => HomeData(null, "", "", "", "", null);

  HomeData copy() => HomeData(forecast, "", "", "", "", current);
}
