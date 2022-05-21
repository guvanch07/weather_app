import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_own_bloc/features/data/datasource/remote_datasourse.dart';
import 'package:weather_app_own_bloc/features/data/models/forcast.dart';
import 'package:weather_app_own_bloc/features/data/models/location.dart';

Widget forcastViewsDaily(Location location) {
  Forecast _forcast;

  return FutureBuilder(
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        _forcast = snapshot.data as Forecast;
        if (_forcast == null) {
          return const Text("Error getting weather");
        } else {
          return _dailyBoxes(_forcast);
        }
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
    future: getForecast(location),
  );
}

Widget _dailyBoxes(Forecast _forcast) {
  return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.only(left: 8, top: 0, bottom: 0, right: 8),
      itemCount: _forcast.daily.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(18)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 1), // changes position of shadow
                  )
                ]),
            padding:
                const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
            margin: const EdgeInsets.all(5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _getDateFromTimestamp(_forcast.daily[index].dt),
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  _getWeatherIconSmall(_forcast.daily[index].icon),
                  Text(
                    "${_forcast.daily[index].high.toInt()}/${_forcast.daily[index].low.toInt()}",
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ]));
      });
}

Image _getWeatherIconSmall(String _icon) {
  String path = 'assets/icons/';
  String imageExtension = ".png";
  return Image.asset(
    path + _icon + imageExtension,
    width: 40,
    height: 40,
  );
}

String _getDateFromTimestamp(int timestamp) {
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var formatter = DateFormat('E');
  return formatter.format(date);
}
