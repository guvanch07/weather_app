part of '../main_page.dart';

class _HourlyHorizatalList extends StatelessWidget {
  const _HourlyHorizatalList({Key? key, required this.screenData})
      : super(key: key);

  final HomeData screenData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: screenData.forecast?.hourly.length,
          itemBuilder: ((context, index) {
            List<Hourly> list = [];
            final data = screenData.forecast?.hourly[index];
            return _HourlyItem(
              time: _mapper.timeFromTimestamp(
                  screenData.forecast?.hourly ?? list, index),
              degree: data?.temp ?? 0,
              icon: _mapper.stringToIconString(data?.icon ?? ""),
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
    return GlassMorphism(
      margin: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(time, style: Styles.headline4),
          SizedBox(
            height: 70,
            width: 70,
            child: Image.asset(icon),
          ),
          Text("${degree.toInt()}°", style: Styles.headline4)
        ],
      ),
    );
  }
}
