part of '../main_page.dart';

class _WeeklVerticalList extends StatelessWidget {
  const _WeeklVerticalList(
      {Key? key, required this.screenData, required this.mapper})
      : super(key: key);

  final HomeData screenData;
  final WeatherMapper mapper;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: screenData.forecast?.daily.length,
        itemBuilder: ((context, index) {
          final data = screenData.forecast?.daily[index];
          return _WeeklItem(
              date: mapper.dateFromTimestamp(data?.dt ?? 0),
              degree: "${data?.high?.toInt()}/${data?.low?.toInt()}",
              icon: mapper.stringToIconString(data?.icon ?? ""));
        }),
      ),
    );
  }
}

class _WeeklItem extends StatelessWidget {
  const _WeeklItem(
      {Key? key, required this.date, required this.icon, required this.degree})
      : super(key: key);
  final String date;
  final String icon;
  final String degree;

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
      margin: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(date, style: Styles.headline4),
          SizedBox(
            height: 70,
            width: 70,
            child: Image.asset(icon),
          ),
          Text(degree, style: Styles.headline4)
        ],
      ),
    );
  }
}
