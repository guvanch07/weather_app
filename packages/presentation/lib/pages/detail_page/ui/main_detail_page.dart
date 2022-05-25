import 'package:flutter/material.dart';
import 'package:presentation/core/base/bloc_state.dart';
import 'package:presentation/core/base/stream_platform_stack_content.dart';
import 'package:presentation/core/styles/classmorphishm.dart';
import 'package:presentation/core/styles/style_text.dart';
import 'package:presentation/mapper/time_date_mapper.dart';
import 'package:presentation/pages/detail_page/bloc/bloc.dart';
import 'package:presentation/pages/detail_page/bloc/bloc_data.dart';
import 'package:presentation/pages/home_page/ui/main_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.city}) : super(key: key);
  final String city;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends BlocState<DetailPage, DetailBloc> {
  @override
  void initState() {
    bloc.getData(city);
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

          if (screenData is DetailData) {
            if (screenData.current == null) {
              return const CircularProgressIndicator.adaptive();
            } else {
              return _DetailsPageItem(
                screenData: screenData,
                appLocalizations: appLocalizations,
                mapper: weatherMapper,
                cityName: widget.city,
              );
            }
          }
        });
  }
}

class _DetailsPageItem extends StatelessWidget {
  const _DetailsPageItem({
    Key? key,
    required this.screenData,
    required this.appLocalizations,
    required this.mapper,
    required this.cityName,
  }) : super(key: key);

  final DetailData screenData;
  final AppLocalizations appLocalizations;
  final WeatherMapper mapper;
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 119, 185, 239),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        GlassMorphism(
            child: Text(
          cityName,
          style: Styles.headline2,
        )),
        GlassMorphism(
          padding: 10,
          child: Column(children: [
            Text(screenData.current?.main ?? "sunny", style: Styles.headline2),
            Text(screenData.current?.description ?? "awesome weather",
                style: Styles.headline4),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Column(
                children: [
                  Text(
                      "${screenData.current?.temp.toInt() ?? 0}${appLocalizations.temp}",
                      style: Styles.headline1),
                  const Text("Humidity", style: Styles.headline4),
                  Text("${screenData.current?.humidity ?? 0}%",
                      style: Styles.headline2),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset(mapper
                          .stringToIconString(screenData.current?.icon ?? ""))),
                  const Text("Pressure", style: Styles.headline3),
                  Text("${screenData.current?.pressure.toInt() ?? 0} hPa",
                      style: Styles.headline2),
                ],
              )
            ]),
          ]),
        ),
      ]),
    );
  }
}
