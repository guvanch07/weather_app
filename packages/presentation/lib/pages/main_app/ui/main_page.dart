import 'package:flutter/material.dart';
import 'package:presentation/core/colors/theme_app.dart';
import 'package:presentation/core/styles/classmorphishm.dart';
import 'package:presentation/core/styles/style_text.dart';
import 'package:presentation/core/utils/path/asset_path.dart';

part "current_weather.dart";
part 'search_title.dart';
part 'hourly_wh.dart';
part 'weekly.dart';

class MainWeatherPage extends StatelessWidget {
  const MainWeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.accentGreen, AppColors.accentOrange],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            SizedBox(height: 15),
            _SeatchTitle(),
            _CurrentWeatherCard(),
            _HourlyHorizatalList(),
            _WeeklVerticalList()
          ],
        ),
      ),
    );
  }
}
