abstract class ApiHelpers {
  static const String baseUrl = "https://api.openweathermap.org/data/2.5/";

  static const String apiKey = "e30558aea931e0d76c61b7a7d117d35b";

  static String forecastWeatherUrl =
      "onecall?lat=$lat&lon=$lon&units=metric&appid=$apiKey";

  static String currentWeatherUrl(String city) =>
      "weather?q=$city&appid=$apiKey&units=metric";

  static const String lat = "53.9006";
  static const String lon = "27.5590";

  static const String cityUrl =
      "raw.githubusercontent.com/dr5hn/countries-states-cities-database/master/cities.json";

  static const String citySearchBaseURL =
      'http://api.openweathermap.org/geo/1.0/direct?q=';

  static const String limitRequestKey = ',BY&limit=5&appid=';
}
