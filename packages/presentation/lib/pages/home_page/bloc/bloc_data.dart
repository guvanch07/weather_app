import 'package:domain/models/forcast.dart';

class HomeData {
  Forecast? forecast;
  String lon = '';
  String lat = '';
  String city = '';
  String country = '';

  HomeData(this.forecast, this.lon, this.lat, this.city, this.country);

  factory HomeData.init() => HomeData(null, "", "", "", "");

  HomeData copy() => HomeData(forecast, "", "", "", "");
}
