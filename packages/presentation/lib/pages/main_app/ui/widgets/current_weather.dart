part of '../main_page.dart';

class _CurrentWeatherCard extends StatelessWidget {
  const _CurrentWeatherCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Sunny", style: Styles.headline3),
        const Text("yess", style: Styles.headline4),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(
            children: const [
              Text("32", style: Styles.headline1),
              Text("min", style: Styles.headline4),
              Text("32", style: Styles.headline2),
            ],
          ),
          Column(
            children: [
              SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(AssetPath.freezing)),
              const Text("max", style: Styles.headline3),
              const Text("32", style: Styles.headline2),
            ],
          )
        ]),
      ],
    ));
  }
}
