part of '../main_page.dart';

class _CurrentWeatherCard extends StatelessWidget {
  const _CurrentWeatherCard(
      {Key? key,
      required this.screenData,
      required this.localizations,
      this.size = 100,
      this.style = Styles.headline1,
      this.margin = 20,
      this.subTitleStyle = Styles.headline2,
      required this.mapper})
      : super(key: key);
  final HomeData screenData;
  final AppLocalizations localizations;
  final WeatherMapper mapper;
  final TextStyle style;
  final double size;
  final double margin;
  final TextStyle subTitleStyle;

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
        padding: 10,
        margin: margin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(screenData.current?.main ?? "sunny", style: subTitleStyle),
            Text(screenData.current?.description ?? "awesome weather",
                style: Styles.headline4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                    "${screenData.current?.temp.toInt() ?? 0}${localizations.temp}",
                    style: style),
                //const Text("Humidity", style: Styles.headline4),
                SizedBox(
                    height: size,
                    width: size,
                    child: Image.asset(mapper
                        .stringToIconString(screenData.current?.icon ?? ""))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("${screenData.current?.humidity ?? 0}%",
                    style: subTitleStyle),
                //const Text("Pressure", style: Styles.headline3),
                Text("${screenData.current?.pressure.toInt() ?? 0} hPa",
                    style: subTitleStyle),
              ],
            )
          ],
        ));
  }
}
