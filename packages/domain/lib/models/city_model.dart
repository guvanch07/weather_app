class CityModel {
  CityModel({
    required this.id,
    required this.name,
    required this.stateId,
    required this.stateCode,
    required this.stateName,
    required this.countryId,
    required this.countryCode,
    required this.countryName,
    required this.latitude,
    required this.longitude,
    required this.wikiDataId,
  });

  final int id;
  final String name;
  final int stateId;
  final String stateCode;
  final String stateName;
  final int countryId;
  final String countryCode;
  final String countryName;
  final String latitude;
  final String longitude;
  final String wikiDataId;

  factory CityModel.fromMap(Map<String, dynamic> json) => CityModel(
        id: json["id"],
        name: json["name"],
        stateId: json["state_id"],
        stateCode: json["state_code"],
        stateName: json["state_name"],
        countryId: json["country_id"],
        countryCode: json["country_code"],
        countryName: json["country_name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        wikiDataId: json["wikiDataId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "state_id": stateId,
        "state_code": stateCode,
        "state_name": stateName,
        "country_id": countryId,
        "country_code": countryCode,
        "country_name": countryName,
        "latitude": latitude,
        "longitude": longitude,
        "wikiDataId": wikiDataId,
      };
}
