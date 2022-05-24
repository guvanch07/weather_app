class CurrentWeather {
  final double temp;
  final double feelsLike;
  final double low;
  final double high;
  final String description;
  final String main;
  final double pressure;
  final double humidity;
  final double wind;
  final String icon;

  CurrentWeather({
    required this.temp,
    required this.feelsLike,
    required this.low,
    required this.high,
    required this.description,
    required this.pressure,
    required this.humidity,
    required this.wind,
    required this.main,
    required this.icon,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      temp: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      low: json['main']['temp_min'].toDouble(),
      high: json['main']['temp_max'].toDouble(),
      description: json['weather'][0]['description'],
      main: json['weather'][0]['main'],
      pressure: json['main']['pressure'].toDouble(),
      humidity: json['main']['humidity'].toDouble(),
      wind: json['wind']['speed'].toDouble(),
      icon: json['weather'][0]['icon'],
    );
  }
}

// class Weather {
//   Weather({
//     required this.coord,
//     required this.weather,
//     required this.base,
//     required this.main,
//     required this.visibility,
//     required this.wind,
//     required this.clouds,
//     required this.dt,
//     required this.sys,
//     required this.timezone,
//     required this.id,
//     required this.name,
//     required this.cod,
//   });

//   final Coord coord;
//   final List<WeatherAll> weather;
//   final String base;
//   final Main main;
//   final int visibility;
//   final Wind wind;
//   final Clouds clouds;
//   final int dt;
//   final Sys sys;
//   final int timezone;
//   final int id;
//   final String name;
//   final int cod;

//   factory Weather.fromMap(Map<String, dynamic> json) => Weather(
//         coord: Coord.fromMap(json["coord"]),
//         weather: List<WeatherAll>.from(
//             json["weather"].map((x) => WeatherAll.fromMap(x))),
//         base: json["base"],
//         main: Main.fromMap(json["main"]),
//         visibility: json["visibility"],
//         wind: Wind.fromMap(json["wind"]),
//         clouds: Clouds.fromMap(json["clouds"]),
//         dt: json["dt"],
//         sys: Sys.fromMap(json["sys"]),
//         timezone: json["timezone"],
//         id: json["id"],
//         name: json["name"],
//         cod: json["cod"],
//       );
// }

// class Clouds {
//   Clouds({
//     this.all,
//   });

//   final int? all;

//   factory Clouds.fromMap(Map<String, dynamic> json) => Clouds(
//         all: json["all"],
//       );

//   Map<String, dynamic> toMap() => {
//         "all": all,
//       };
// }

// class Coord {
//   Coord({
//     this.lon,
//     this.lat,
//   });

//   final double? lon;
//   final double? lat;

//   factory Coord.fromMap(Map<String, dynamic> json) => Coord(
//         lon: json["lon"].toDouble(),
//         lat: json["lat"].toDouble(),
//       );

//   Map<String, dynamic> toMap() => {
//         "lon": lon,
//         "lat": lat,
//       };
// }

// class Main {
//   Main({
//     this.temp,
//     this.feelsLike,
//     this.tempMin,
//     this.tempMax,
//     this.pressure,
//     this.humidity,
//     this.seaLevel,
//     this.grndLevel,
//   });

//   final double? temp;
//   final double? feelsLike;
//   final double? tempMin;
//   final double? tempMax;
//   final int? pressure;
//   final int? humidity;
//   final int? seaLevel;
//   final int? grndLevel;

//   factory Main.fromMap(Map<String, dynamic> json) => Main(
//         temp: json["temp"].toDouble(),
//         feelsLike: json["feels_like"].toDouble(),
//         tempMin: json["temp_min"].toDouble(),
//         tempMax: json["temp_max"].toDouble(),
//         pressure: json["pressure"],
//         humidity: json["humidity"],
//         seaLevel: json["sea_level"],
//         grndLevel: json["grnd_level"],
//       );

//   Map<String, dynamic> toMap() => {
//         "temp": temp,
//         "feels_like": feelsLike,
//         "temp_min": tempMin,
//         "temp_max": tempMax,
//         "pressure": pressure,
//         "humidity": humidity,
//         "sea_level": seaLevel,
//         "grnd_level": grndLevel,
//       };
// }

// class Sys {
//   Sys({
//     required this.type,
//     required this.id,
//     required this.country,
//     required this.sunrise,
//     required this.sunset,
//   });

//   final int type;
//   final int id;
//   final String country;
//   final int sunrise;
//   final int sunset;

//   factory Sys.fromMap(Map<String, dynamic> json) => Sys(
//         type: json["type"],
//         id: json["id"],
//         country: json["country"],
//         sunrise: json["sunrise"],
//         sunset: json["sunset"],
//       );

//   Map<String, dynamic> toMap() => {
//         "type": type,
//         "id": id,
//         "country": country,
//         "sunrise": sunrise,
//         "sunset": sunset,
//       };
// }

// class WeatherAll {
//   WeatherAll({
//     required this.id,
//     required this.main,
//     required this.description,
//     required this.icon,
//   });

//   final int id;
//   final String main;
//   final String description;
//   final String icon;

//   factory WeatherAll.fromMap(Map<String, dynamic> json) => WeatherAll(
//         id: json["id"],
//         main: json["main"],
//         description: json["description"],
//         icon: json["icon"],
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "main": main,
//         "description": description,
//         "icon": icon,
//       };
// }

// class Wind {
//   Wind({
//     this.speed,
//     this.deg,
//     this.gust,
//   });

//   final double? speed;
//   final int? deg;
//   final double? gust;

//   factory Wind.fromMap(Map<String, dynamic> json) => Wind(
//         speed: json["speed"].toDouble(),
//         deg: json["deg"],
//         gust: json["gust"].toDouble(),
//       );

//   Map<String, dynamic> toMap() => {
//         "speed": speed,
//         "deg": deg,
//         "gust": gust,
//       };
// }
