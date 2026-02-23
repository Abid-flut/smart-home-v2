
import 'package:smart_home_v2/weather/models/weather_model.dart';
import 'package:smart_home_v2/weather/services/weather_service.dart';

class MockWeatherService implements WeatherService{



  Future<WeatherModel> fetchWeather(String city) async{

    WeatherModel weather = WeatherModel(
        temperature: 10,
        condition: "rainy",
        city: "Bucharest",
        iconCode: "RainIcon");

    await Future.delayed(Duration(seconds: 1));

     return weather;

  }


}