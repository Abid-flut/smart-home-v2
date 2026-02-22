import 'package:smart_home_v2/weather/models/weather_model.dart';

abstract class WeatherService {

  Future<WeatherModel> fetchWeather(String city);

}
