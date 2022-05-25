import 'package:domain/models/weather.dart';

class DetailData {
  CurrentWeather? current;

  DetailData(
    this.current,
  );

  factory DetailData.init() => DetailData(null);

  DetailData copy() => DetailData(
        current,
      );
}
