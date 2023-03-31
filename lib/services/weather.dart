import 'package:climawhether/services/networking.dart';
import 'package:climawhether/services/location.dart';

const apikey = 'dd3c1845f18f4a6eb48162747230802';

class WeatherModel {
  Future<dynamic> getCityweather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.weatherapi.com/v1/current.json?key=$apikey&q=$cityName');

    var cityWeather = await networkHelper.getData();

    return cityWeather;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.weatherapi.com/v1/current.json?key=$apikey&q=${location.latitude},${location.longitude}');

    var whetherData = await networkHelper.getData();

    return whetherData;
  }

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
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
