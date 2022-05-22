abstract class ApiHelpers {
  static const String baseUrl = "https://api.openweathermap.org/";

  static const String apiKey = "e30558aea931e0d76c61b7a7d117d35b";
  static String weatherUrl(String lat, String lon) =>
      "data/2.5/onecall?lat=$lat&lon=$lon&units=metric&appid=$apiKey";
  //static const String lat = "53.9006";
  // static const String lon = "27.5590";
  static const String cityUrl =
      "https://raw.githubusercontent.com/dr5hn/countries-states-cities-database/master/cities.json";
}
