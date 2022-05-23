import 'package:intl/intl.dart';
import 'package:presentation/core/utils/path/asset_path.dart';
import 'package:domain/models/hourly.dart';

abstract class WeatherMapper {
  factory WeatherMapper() => _WeatherMapper();
  String timeFromTimestamp(List<Hourly> hourly, int index);

  String dateFromTimestamp(int timestamp);

  String stringToIconString(String icon);
}

class _WeatherMapper implements WeatherMapper {
  @override
  String timeFromTimestamp(List<Hourly> hourly, int index) {
    late DateTime date;
    late DateFormat formatter;
    int hour = int.parse(DateFormat("hh").format(DateTime.now()));
    for (var i = hour; i < hourly.length; i += 6) {
      date = DateTime.fromMillisecondsSinceEpoch(hourly[index].dt * 1000);

      formatter = DateFormat('h:mm');
    }
    return formatter.format(date);
  }

  @override
  String dateFromTimestamp(int timestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    DateFormat formatter = DateFormat('E');
    return formatter.format(date);
  }

  @override
  String stringToIconString(String icon) {
    switch (icon) {
      case "01d":
        return AssetPath.sunny;
      case "01n":
        return AssetPath.night;
      case "02d":
        return AssetPath.cloudSun;
      case "02n":
        return AssetPath.cloudNight;
      case "03d":
        return AssetPath.cloudSun;
      case "03n":
        return AssetPath.cloudNight;
      case "04d":
        return AssetPath.cloudSun;
      case "04n":
        return AssetPath.cloudNight;
      case "09d":
        return AssetPath.rain;
      case "09n":
        return AssetPath.rain;
      case "10d":
        return AssetPath.shortRain;
      case "10n":
        return AssetPath.shortRain;
      case "13d":
        return AssetPath.freezing;
      case "13n":
        return AssetPath.freezing;
      case "50d":
        return AssetPath.sunnyRow;
      case "50n":
        return AssetPath.nightRow;

      default:
        return "";
    }
  }
}
