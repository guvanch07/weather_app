import 'package:flutter/material.dart';
import 'package:presentation/core/base/bloc_state.dart';
import 'package:presentation/core/base/stream_platform_stack_content.dart';
import 'package:presentation/core/colors/theme_app.dart';
import 'package:presentation/core/styles/classmorphishm.dart';
import 'package:presentation/core/styles/style_text.dart';
import 'package:presentation/core/utils/path/asset_path.dart';
import 'package:presentation/mapper/time_date_mapper.dart';
import 'package:domain/models/hourly.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/pages/home_page/bloc/bloc.dart';
import 'package:presentation/pages/home_page/bloc/bloc_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:presentation/core/base/bloc_state.dart';

part 'widgets/current_weather.dart';
part 'widgets/search_title.dart';
part 'widgets/hourly_wh.dart';
part 'widgets/weekly.dart';

final _mapper = GetIt.I<WeatherMapper>();

class MainAppPage extends StatefulWidget {
  const MainAppPage({Key? key}) : super(key: key);

  @override
  State<MainAppPage> createState() => _MainAppPageState();
}

class _MainAppPageState extends BlocState<MainAppPage, HomeBloc> {
  @override
  void initState() {
    bloc.getData();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    appLocalizations = AppLocalizations.of(context)!;
    return StreamPlatformStackContent(
        dataStream: bloc.dataStream,
        children: (blocData) {
          final screenData = blocData.data;
          if (screenData is HomeData) {
            if (screenData.forecast == null) {
              return const CircularProgressIndicator.adaptive();
            } else {
              return MainWeatherPage(
                appLocalizations: appLocalizations,
                homeData: screenData,
              );
            }
          }
        });
  }
}

class MainWeatherPage extends StatelessWidget {
  const MainWeatherPage(
      {Key? key, required this.homeData, required this.appLocalizations})
      : super(key: key);
  final HomeData homeData;
  final AppLocalizations appLocalizations;
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
          children: [
            const SizedBox(height: 15),
            const _SeatchTitle(),
            _CurrentWeatherCard(
              screenData: homeData,
              localizations: appLocalizations,
            ),
            _HourlyHorizatalList(screenData: homeData),
            _WeeklVerticalList(screenData: homeData)
          ],
        ),
      ),
    );
  }
}
