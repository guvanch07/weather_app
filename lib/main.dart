import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_own_bloc/features/presentation/pages/current_page.dart';

import 'core/const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocationPoint(),
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: CurrentWeatherPage(context: context),
      ),
    );
  }
}
