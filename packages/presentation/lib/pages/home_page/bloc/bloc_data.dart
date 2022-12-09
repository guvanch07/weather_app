import 'package:domain/models/city_model.dart';
import 'package:domain/models/forcast.dart';
import 'package:domain/models/weather/weather.dart';

class HomeData {
  Forecast? forecast;
  CurrentWeather? current;
  List<City>? cityModel;
  String city = '';

  HomeData(this.forecast, this.city, this.current, this.cityModel);

  factory HomeData.init() => HomeData(null, "", null, []);

  HomeData copy() => HomeData(forecast, "", current, cityModel);
}
