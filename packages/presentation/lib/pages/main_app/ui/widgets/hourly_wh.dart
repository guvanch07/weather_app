part of '../main_page.dart';

class _HourlyHorizatalList extends StatelessWidget {
  const _HourlyHorizatalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: ((context, index) => const _HourlyItem(
                time: '11:11',
                degree: '32',
                icon: AssetPath.cloudSun,
              )),
        ));
  }
}

class _HourlyItem extends StatelessWidget {
  const _HourlyItem(
      {Key? key, required this.time, required this.icon, required this.degree})
      : super(key: key);
  final String time;
  final String icon;
  final String degree;

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
          Text(degree, style: Styles.headline4)
        ],
      ),
    );
  }
}
