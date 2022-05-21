import 'package:flutter/material.dart';
import 'package:weather_app_own_bloc/core/extensions.dart';
import 'package:weather_app_own_bloc/features/data/datasource/remote_datasourse.dart';
import 'package:weather_app_own_bloc/features/data/models/location.dart';
import 'package:weather_app_own_bloc/features/data/models/weather.dart';

import 'paint_box.dart';

Widget currentWeatherViews(Location location, BuildContext context) {
  Weather _weather;

  return FutureBuilder(
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        _weather = snapshot.data as Weather;
        if (_weather == null) {
          return const Text("Error getting weather");
        } else {
          return Column(children: [
            _createAppBar(location, context),
            _weatherBox(_weather),
            _weatherDetailsBox(_weather),
          ]);
        }
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
    future: getCurrentWeather(location),
  );
}

Widget _createAppBar(Location Location, BuildContext context) {
  return GestureDetector(
    onTap: () {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return _snackBar();
        },
      );
    },
    child: Container(
        padding:
            const EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 20),
        margin: const EdgeInsets.only(
            top: 35, left: 15.0, bottom: 15.0, right: 15.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(60)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              )
            ]),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: '${Location.city.capitalizeFirstOfEach}, ',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  TextSpan(
                      text: Location.country.capitalizeFirstOfEach,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16)),
                ],
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.black,
              size: 24.0,
              semanticLabel: 'Tap to change Location',
            ),
          ],
        )),
  );
}

Widget _weatherBox(Weather _weather) {
  return Stack(children: [
    Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.all(15.0),
      height: 160.0,
      decoration: const BoxDecoration(
          color: Colors.indigoAccent,
          borderRadius: BorderRadius.all(Radius.circular(20))),
    ),
    ClipPath(
        clipper: Clipper(),
        child: Container(
            padding: const EdgeInsets.all(15.0),
            margin: const EdgeInsets.all(15.0),
            height: 160.0,
            decoration: BoxDecoration(
                color: Colors.indigoAccent[400],
                borderRadius: const BorderRadius.all(Radius.circular(20))))),
    Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.all(15.0),
        height: 160.0,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _getWeatherIcon(_weather.icon),
                  Container(
                      margin: const EdgeInsets.all(5.0),
                      child: Text(
                        _weather.description.capitalizeFirstOfEach,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.white),
                      )),
                  Container(
                      margin: const EdgeInsets.all(5.0),
                      child: Text(
                        "H:${_weather.high.toInt()}° L:${_weather.low.toInt()}°",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                            color: Colors.white),
                      )),
                ]),
            Column(children: <Widget>[
              Text(
                "${_weather.temp.toInt()}°",
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                    color: Colors.white),
              ),
              Container(
                  margin: const EdgeInsets.all(0),
                  child: Text(
                    "Feels like ${_weather.feelsLike.toInt()}°",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        color: Colors.white),
                  )),
            ])
          ],
        ))
  ]);
}

Widget _weatherDetailsBox(Weather _weather) {
  return Container(
    padding: const EdgeInsets.only(left: 15, top: 25, bottom: 25, right: 15),
    margin: const EdgeInsets.only(left: 15, top: 5, bottom: 15, right: 15),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            const Text(
              "Wind",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Colors.grey),
            ),
            Text(
              "${_weather.wind} km/h",
              textAlign: TextAlign.left,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Colors.black),
            )
          ],
        ),
        Column(
          children: [
            const Text(
              "Humidity",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Colors.grey),
            ),
            Text(
              "${_weather.humidity.toInt()}%",
              textAlign: TextAlign.left,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Colors.black),
            )
          ],
        ),
        Column(
          children: [
            const Text(
              "Pressure",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Colors.grey),
            ),
            Text(
              "${_weather.pressure} hPa",
              textAlign: TextAlign.left,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Colors.black),
            )
          ],
        )
      ],
    ),
  );
}

Image _getWeatherIcon(String _icon) {
  String path = 'assets/icons/';
  String imageExtension = ".png";
  return Image.asset(
    path + _icon + imageExtension,
    width: 70,
    height: 70,
  );
}

Widget _snackBar() {
  return Column(
    children: const [
      Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Colors.black,
        size: 24.0,
        semanticLabel: 'Tap to change Location',
      ),
    ],
  );
}
