import 'weather_service.dart';
import 'package:smart_home_v2/weather/models/weather_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class RealWeatherService implements WeatherService{

  @override
  Future<WeatherModel> fetchWeather(String city) async{

    const String apiKey = "99c13c6467d5ac8e1a6e11bb5bd3b0db";

    final url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$apiKey",
    );

    final response = await http.get(url);

    if(response.statusCode == 200){

      final Map<String,dynamic> data = jsonDecode(response.body);

      final double temperature = (data["main"]["temp"] as num).toDouble();
      final String cityName = data["name"];
      final String description = data['weather'].first['description'];
      final String iconCode = data['weather'][0]['icon'];
      print('icon from API: $iconCode');
      return WeatherModel(
          temperature: temperature,
          condition: description,
          city: cityName,
          iconCode: iconCode);

    }
    else{
      throw Exception("Failed to load Weather");
    }


  }


}