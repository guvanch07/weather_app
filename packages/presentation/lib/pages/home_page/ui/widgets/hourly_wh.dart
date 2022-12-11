// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../main_page.dart';

class _HourlyHorizatalList extends StatelessWidget {
  const _HourlyHorizatalList({
    Key? key,
    required this.screenData,
    required this.mapper,
    this.scrollDirection = Axis.horizontal,
    required this.heightRatio,
    required this.widthtRatio,
  }) : super(key: key);

  final HomeData screenData;
  final WeatherMapper mapper;
  final Axis scrollDirection;
  final double heightRatio;
  final double widthtRatio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: heightRatio,
        width: widthtRatio,
        child: ListView.builder(
          scrollDirection: scrollDirection,
          itemCount: screenData.forecast?.hourly.length,
          itemBuilder: ((context, index) {
            final data = screenData.forecast?.hourly[index];
            return _HourlyItem(
              time: mapper.timeFromTimestamp(
                  screenData.forecast?.hourly ?? [], index),
              degree: data?.temp ?? 0,
              icon: mapper.stringToIconString(data?.icon ?? ""),
            );
          }),
        ));
  }
}

class _HourlyItem extends StatelessWidget {
  const _HourlyItem(
      {Key? key, required this.time, required this.icon, required this.degree})
      : super(key: key);
  final String time;
  final String icon;
  final double degree;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: GlassMorphism(
        margin: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(time, style: Styles.headline4.copyWith(fontSize: 12)),
            Image.asset(icon),
            Text("${degree.toInt()}°", style: Styles.headline4)
          ],
        ),
      ),
    );
  }
}
