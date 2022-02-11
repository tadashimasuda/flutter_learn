import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    NetworkHelper networkHelper = NetworkHelper(url:
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&&appid=85f364c6573bf8de09d146383314a00b&units=metric'
    );

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocaitonData() async{
    Locaiton location = Locaiton();
    await location.getCurrentLocation();

    String url = 'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=85f364c6573bf8de09d146383314a00b&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);

    var weatherData = await networkHelper.getData();

    return weatherData;
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
