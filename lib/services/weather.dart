import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apiKey = '9d23ec8c8a7b22c9e5f643025ada6cb6';
const OWMurl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    // latitude = location.latitude;
    // longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        '$OWMurl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$OWMurl?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getbackground(int condition) {
    if (condition < 300) {
      return 'images/rainbgp.jpg';
    } else if (condition < 400) {
      return 'images/stormybgp.jpg';
    } else if (condition < 600) {
      return 'images/stormybgp.jpg';
    } else if (condition < 700) {
      return 'images/snowybgp.jpg';
    } else if (condition < 800) {
      return 'images/foggybgp.jpg';
    } else if (condition == 800) {
      return 'images/hotbgp.jpg';
    } else if (condition <= 804) {
      return 'images/cloudybgp.jpg';
    } else {
      return 'images/location_background.jpg‍';
    }
  }

  String getMessage(var temp) {
    if (temp > 27) {
      return "It's a warm day ";
    } else if (temp > 20) {
      return 'Great day to go out';
    } else if (temp < 20) {
      return 'Quite chilly';
    } else {
      return 'Probably gonna need a jacket';
    }
  }
}
