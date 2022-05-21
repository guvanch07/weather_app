import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app_own_bloc/core/api_key.dart';
import 'package:weather_app_own_bloc/features/data/models/forcast.dart';
import 'package:weather_app_own_bloc/features/data/models/location.dart';
import 'package:weather_app_own_bloc/features/data/models/weather.dart';

Future getCurrentWeather(Location locationWeather) async {
  Weather? weather;
  String city = locationWeather.city;
  var url =
      "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    weather = Weather.fromJson(jsonDecode(response.body));
  }

  return weather;
}

Future getForecast(Location locationWeather) async {
  Forecast? forecast;
  String lat = locationWeather.lat;
  String lon = locationWeather.lon;
  var url =
      "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    forecast = Forecast.fromJson(jsonDecode(response.body));
  }

  return forecast;
}
