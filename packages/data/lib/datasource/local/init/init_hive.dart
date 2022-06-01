import 'package:domain/models/weather/weather.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter<CurrentWeather>(CurrentWeatherAdapter());
  await Hive.openBox<CurrentWeather>("test");
}

abstract class HiveHelpers {
  static const test = 'test';
  static final Box<CurrentWeather> testBox = Hive.box(test);
}

abstract class HiveKeys {
  static const String testKey = "testKey";
}
