import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'geolocator.dart';

// String lat = "";
// String lon = "";
// String city = "";
// String country = "";

class LocationPoint extends ChangeNotifier {
  String lat = "";
  String lon = "";
  String city = "";
  String country = "";

  Future locationPoint() async {
    Position pos = await determinePosition();
    List<Placemark> pm =
        await placemarkFromCoordinates(pos.latitude, pos.longitude);
    Placemark place = pm[0];
    lat = pos.latitude.toString();
    lon = pos.longitude.toString();
    city = place.locality.toString();
    country = place.country.toString();

    notifyListeners();
  }
}

// Future locationPoint() async {
//   Position pos = await determinePosition();
//   List<Placemark> pm =
//       await placemarkFromCoordinates(pos.latitude, pos.longitude);
//   Placemark place = pm[0];
//   lat = pos.latitude.toString();
//   lon = pos.longitude.toString();
//   city = place.locality.toString();
//   country = place.country.toString();
//   print(pos.latitude.toString());
//   print(pos.longitude.toString());
//   print(place.locality.toString());
//   print(place.country.toString());
// }
