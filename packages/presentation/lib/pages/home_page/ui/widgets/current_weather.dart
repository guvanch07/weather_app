part of '../main_page.dart';

class _CurrentWeatherCard extends StatelessWidget {
  const _CurrentWeatherCard(
      {Key? key,
      required this.screenData,
      required this.localizations,
      required this.mapper})
      : super(key: key);
  final HomeData screenData;
  final AppLocalizations localizations;
  final WeatherMapper mapper;

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
        padding: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(screenData.current?.main ?? "sunny", style: Styles.headline2),
            Text(screenData.current?.description ?? "awesome weather",
                style: Styles.headline4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                    "${screenData.current?.temp.toInt() ?? 0}${localizations.temp}",
                    style: Styles.headline1),
                //const Text("Humidity", style: Styles.headline4),
                SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(mapper
                        .stringToIconString(screenData.current?.icon ?? ""))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("${screenData.current?.humidity ?? 0}%",
                    style: Styles.headline2),
                //const Text("Pressure", style: Styles.headline3),
                Text("${screenData.current?.pressure.toInt() ?? 0} hPa",
                    style: Styles.headline2),
              ],
            )
          ],
        ));
  }
}
