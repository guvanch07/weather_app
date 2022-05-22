part of "main_page.dart";

class _WeeklVerticalList extends StatelessWidget {
  const _WeeklVerticalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: ((context, index) => const _WeeklItem(
                date: 'sdds',
                degree: '32',
                icon: AssetPath.cloudSun,
              )),
        ));
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
