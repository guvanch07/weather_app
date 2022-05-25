abstract class ApiHelpers {
  static const String baseUrl = "https://";

  static const String apiKey = "e30558aea931e0d76c61b7a7d117d35b";

  static String forecastWeatherUrl =
      "api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&units=metric&appid=$apiKey";

  //static const String city = "Minsk";

  static String currentWeatherUrl(String city) =>
      "api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

  static const String lat = "53.9006";
  static const String lon = "27.5590";

  static const String cityUrl =
      "raw.githubusercontent.com/dr5hn/countries-states-cities-database/master/cities.json";
}
