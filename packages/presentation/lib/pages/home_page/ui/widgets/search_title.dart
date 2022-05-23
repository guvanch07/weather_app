part of '../main_page.dart';

class _SeatchTitle extends StatefulWidget {
  const _SeatchTitle({Key? key}) : super(key: key);

  @override
  State<_SeatchTitle> createState() => _SeatchTitleState();
}

class _SeatchTitleState extends State<_SeatchTitle> {
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => setState(() => isShow = !isShow)),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Center(
          child: AnimatedCrossFade(
              alignment: Alignment.center,
              firstChild: const _HeaderTitle(),
              secondChild: const _TextField(),
              secondCurve: Curves.bounceIn,
              firstCurve: Curves.bounceIn,
              crossFadeState:
                  isShow ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 700)),
        ),
      ),
    );
  }
}

class _HeaderTitle extends StatelessWidget {
  const _HeaderTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Minsk", style: Styles.headline2);
  }
}

class _TextField extends StatelessWidget {
  const _TextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: AppColors.errorColor)),
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(16),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: AppColors.accentGreen)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Color.fromARGB(255, 8, 111, 49))),
        hintText: "Search City....",
        hintStyle: Styles.headline3,
      ),
    );
  }
}
