import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:presentation/core/base/bloc_state.dart';
import 'package:presentation/core/base/stream_platform_stack_content.dart';
import 'package:presentation/core/colors/theme_app.dart';
import 'package:presentation/core/styles/classmorphishm.dart';
import 'package:presentation/core/styles/style_text.dart';
import 'package:presentation/mapper/time_date_mapper.dart';
import 'package:presentation/pages/home_page/bloc/bloc.dart';
import 'package:presentation/pages/home_page/bloc/bloc_data.dart';
import 'package:presentation/pages/home_page/ui/widgets/search_text_field.dart';

part 'widgets/current_weather.dart';
part 'widgets/hourly_wh.dart';
part 'widgets/search_title.dart';
part 'widgets/weekly.dart';

class MainAppPage extends StatefulWidget {
  const MainAppPage({Key? key}) : super(key: key);

  @override
  State<MainAppPage> createState() => _MainAppPageState();
}

class _MainAppPageState extends BlocState<MainAppPage, HomeBloc> {
  @override
  void initState() {
    //bloc.initState();
    bloc.getData(
        'Minsk'); //! it is just mock, usully it can be from current location of device
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
                mapper: weatherMapper,
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
      {Key? key,
      required this.homeData,
      required this.appLocalizations,
      required this.mapper})
      : super(key: key);
  final HomeData homeData;
  final AppLocalizations appLocalizations;
  final WeatherMapper mapper;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.accentGreen, AppColors.accentOrange],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: SafeArea(
          child: OrientationBuilder(
            builder: (context, orientation) => orientation ==
                    Orientation.portrait
                ? ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const SizedBox(height: 15),
                      const _SeatchTitle(),
                      _CurrentWeatherCard(
                        screenData: homeData,
                        localizations: appLocalizations,
                        mapper: mapper,
                      ),
                      _HourlyHorizatalList(
                        widthtRatio: MediaQuery.of(context).size.width,
                        heightRatio: MediaQuery.of(context).size.height * 0.18,
                        screenData: homeData,
                        mapper: mapper,
                      ),
                      _WeeklVerticalList(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        screenData: homeData,
                        mapper: mapper,
                      )
                    ],
                  )
                : Column(
                    children: [
                      const _SeatchTitle(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              _CurrentWeatherCard(
                                margin: 10,
                                style: Styles.headline2.copyWith(fontSize: 40),
                                size: 60,
                                subTitleStyle: Styles.headline3,
                                screenData: homeData,
                                localizations: appLocalizations,
                                mapper: mapper,
                              ),
                              _HourlyHorizatalList(
                                widthtRatio:
                                    MediaQuery.of(context).size.width * 0.45,
                                heightRatio:
                                    MediaQuery.of(context).size.height * 0.37,
                                scrollDirection: Axis.horizontal,
                                screenData: homeData,
                                mapper: mapper,
                              ),
                            ],
                          ),
                          _WeeklVerticalList(
                            height: MediaQuery.of(context).size.height - 70,
                            width: MediaQuery.of(context).size.width * 0.4,
                            physics: const BouncingScrollPhysics(),
                            screenData: homeData,
                            mapper: mapper,
                          )
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
