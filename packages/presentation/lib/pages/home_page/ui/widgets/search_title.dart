part of '../main_page.dart';

class _SeatchTitle extends StatefulWidget {
  const _SeatchTitle({
    Key? key,
  }) : super(key: key);

  @override
  State<_SeatchTitle> createState() => _SeatchTitleState();
}

class _SeatchTitleState extends BlocState<_SeatchTitle, HomeBloc> {
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
              secondChild: CitySearchField(
                initVal: 'Minsk',
                suggestionsCallback: (String query) {
                  return bloc.searchQuery(query);
                },
              ),
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




// class _TextField extends StatelessWidget {
//   const _TextField({Key? key, required this.screenData}) : super(key: key);
//   final HomeData screenData;

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       onTap: (() => showSearch(
//           useRootNavigator: true,
//           context: context,
//           delegate: _CustomSearchDelegate(screenData))),
//       decoration: const InputDecoration(
//         focusedErrorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//             borderSide: BorderSide(color: AppColors.errorColor)),
//         fillColor: Colors.white,
//         contentPadding: EdgeInsets.all(16),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//             borderSide: BorderSide(color: AppColors.accentGreen)),
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//             borderSide: BorderSide(color: Color.fromARGB(255, 8, 111, 49))),
//         hintText: "Search City....",
//         hintStyle: Styles.headline3,
//       ),
//     );
//   }
// }

// class _CustomSearchDelegate extends SearchDelegate {
//   final HomeData screenData;

//   _CustomSearchDelegate(this.screenData);
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(Icons.clear),
//         onPressed: (() {
//           query = "";
//         }),
//       )
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           close(context, null);
//         },
//         icon: const Icon(Icons.arrow_back_ios));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     List<String> matchQuery = [];
//     for (City item in screenData.cityModel ?? []) {
//       if (item.name.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(item.name);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (BuildContext context, int index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result,
//               style: Styles.headline4.copyWith(color: Colors.black)),
//         );
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> matchQuery = [];
//     for (City item in screenData.cityModel ?? []) {
//       if (item.name.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(item.name);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (BuildContext context, int index) {
//         var result = matchQuery[index];
//         return InkWell(
//           onTap: (() => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => DetailPage(city: result),
//                 ),
//               )),
//           child: ListTile(
//             title: Text(result,
//                 style: Styles.headline4.copyWith(color: Colors.black)),
//           ),
//         );
//       },
//     );
//   }
// }
