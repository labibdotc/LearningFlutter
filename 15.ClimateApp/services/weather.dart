import 'package:climafinale/services/location.dart';
import 'package:climafinale/services/networking.dart';

const APIKey = String.fromEnvironment('OpenWeatherAPIKey');

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp > 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    String lat = location.latitude().toString();
    String lon = location.longitude().toString();

    Uri url = Uri(
        scheme: 'https',
        host: 'api.openweathermap.org',
        path: 'data/2.5/weather',
        queryParameters: {'lat': lat, 'lon': lon, 'appid': APIKey, 'units': 'metric'});

    Network networkHelper = Network(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
    // Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(weatherData: weatherData,)));

    //   print(condition.toString() + temp.toString() + city);

  }
  Future<dynamic> getCityWeather(String city) async {
    Uri url = Uri(
        scheme: 'https',
        host: 'api.openweathermap.org',
        path: 'data/2.5/weather',
        queryParameters: {'q': city, 'appid': APIKey, 'units': 'metric'});
    Network networkHelper = Network(url);

    var weatherData = await networkHelper.getData();
    return weatherData;

  }
}
