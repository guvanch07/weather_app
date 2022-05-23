import 'package:domain/models/daily.dart';
import 'package:domain/models/hourly.dart';

class Forecast {
  final List<Hourly> hourly;
  final List<Daily> daily;

  Forecast({required this.hourly, required this.daily});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    List<dynamic> hourlyData = json['hourly'];
    List<dynamic> dailyData = json['daily'];

    List<Hourly> hourly = [];
    List<Daily> daily = [];

    for (var item in hourlyData) {
      Hourly hour = Hourly.fromJson(item);
      hourly.add(hour);
    }

    for (var item in dailyData) {
      Daily day = Daily.fromJson(item);
      daily.add(day);
    }

    return Forecast(hourly: hourly, daily: daily);
  }
}
