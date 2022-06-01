import 'dart:convert';

import 'package:domain/repository/current_data/base_response.dart';

class CurrentResponse implements ICurrentResponse {
  @override
  final List<dynamic>? currentData;

  CurrentResponse(this.currentData);

  static CurrentResponse? fromJson(dynamic data) {
    if (data == null || data.isEmpty) {
      return null;
    }

    var jsonData = data;
    if (data is String) {
      jsonData = json.decode(data);
    }

    return CurrentResponse(jsonData["main"]);
  }
}

class CurrentCityResponse implements ICurrentResponse {
  @override
  final List<dynamic>? currentData;

  CurrentCityResponse(this.currentData);

  static CurrentCityResponse? fromJson(dynamic data) {
    if (data == null || data.isEmpty) {
      return null;
    }

    var jsonData = data;
    if (data is String) {
      jsonData = json.decode(data);
    }

    return CurrentCityResponse(jsonData["name"]);
  }
}
