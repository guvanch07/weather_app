import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'weather.g.dart';

@HiveType(typeId: 0)
class CurrentWeather extends Equatable {
  @HiveField(0)
  final double temp;
  @HiveField(1)
  final double feelsLike;
  @HiveField(2)
  final double low;
  @HiveField(3)
  final double high;
  @HiveField(4)
  final String description;
  @HiveField(5)
  final String main;
  @HiveField(6)
  final double pressure;
  @HiveField(7)
  final double humidity;
  @HiveField(8)
  final double wind;
  @HiveField(9)
  final String icon;

  const CurrentWeather({
    required this.temp,
    required this.feelsLike,
    required this.low,
    required this.high,
    required this.description,
    required this.pressure,
    required this.humidity,
    required this.wind,
    required this.main,
    required this.icon,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      temp: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      low: json['main']['temp_min'].toDouble(),
      high: json['main']['temp_max'].toDouble(),
      description: json['weather'][0]['description'],
      main: json['weather'][0]['main'],
      pressure: json['main']['pressure'].toDouble(),
      humidity: json['main']['humidity'].toDouble(),
      wind: json['wind']['speed'].toDouble(),
      icon: json['weather'][0]['icon'],
    );
  }

  @override
  List<Object?> get props => [
        temp,
        feelsLike,
        low,
        high,
        description,
        pressure,
        humidity,
        wind,
        main,
        icon,
      ];
}
