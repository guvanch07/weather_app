import 'dart:developer';

import 'package:domain/models/city_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:presentation/pages/detail_page/ui/main_detail_page.dart';

class CitySearchField extends StatefulWidget {
  const CitySearchField({
    required this.initVal,
    required this.suggestionsCallback,
    super.key,
  });

  final String initVal;

  final Future<List<City>> Function(String) suggestionsCallback;

  @override
  State<CitySearchField> createState() => _CitySearchFieldState();
}

class _CitySearchFieldState extends State<CitySearchField> {
  final TextEditingController controller = TextEditingController();
  List<City> citiesList = [];

  @override
  void initState() {
    controller.text = widget.initVal;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final textStyle = textTheme.subtitle1;

    return TypeAheadField(
      suggestionsBoxVerticalOffset: 5,
      hideSuggestionsOnKeyboardHide: true,
      textFieldConfiguration: TextFieldConfiguration(
        onChanged: (value) => {},
        controller: controller,
        style: textStyle,
        decoration: InputDecoration(
          hintText: 'Введите город',
          hintStyle: textStyle,
        ),
      ),
      noItemsFoundBuilder: (context) {
        return const SizedBox.shrink();
      },
      suggestionsBoxDecoration: const SuggestionsBoxDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(6),
            bottomRight: Radius.circular(6),
          ),
        ),
      ),
      suggestionsCallback: (pattern) async {
        citiesList = await widget.suggestionsCallback(pattern);
        return citiesList;
      },
      itemBuilder: (context, suggestion) {
        return ColoredBox(
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              suggestion.state == null
                  ? suggestion.name
                  : '${suggestion.name}, ${suggestion.state}',
              style: textStyle,
            ),
          ),
        );
      },
      onSuggestionSelected: (suggestion) {
        controller.text = suggestion.name;

        log(suggestion.name);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(city: suggestion.name),
          ),
        );
      },
    );
  }
}
