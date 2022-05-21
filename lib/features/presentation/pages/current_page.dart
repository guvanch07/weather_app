import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_own_bloc/core/const.dart';
import 'package:weather_app_own_bloc/features/data/models/location.dart';
import 'package:weather_app_own_bloc/features/presentation/widgets/current_weather.dart';
import 'package:weather_app_own_bloc/features/presentation/widgets/daily_weather.dart';
import 'package:weather_app_own_bloc/features/presentation/widgets/hourly_view.dart';

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({
    Key? key,
    required this.context,
  }) : super(key: key);
  final BuildContext context;

  @override
  _CurrentWeatherPageState createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  @override
  void initState() {
    context.read<LocationPoint>().locationPoint();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LocationPoint>();
    final Location location = Location(
        city: provider.city,
        country: provider.country,
        lat: provider.lat,
        lon: provider.lon);
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: ListView(children: <Widget>[
          currentWeatherViews(location, context),
          forcastViewsHourly(location),
          forcastViewsDaily(location),
        ]));
  }
}
