import 'package:flutter/material.dart';
import 'package:smart_home_v2/weather/services/weather_service.dart';
import 'package:smart_home_v2/weather/weather_status.dart';

import 'models/weather_model.dart';

class WeatherProvider extends ChangeNotifier{

  final WeatherService _service ;


  WeatherProvider({
    required WeatherService service
  }): _service = service;

  WeatherStatus _status = WeatherStatus.initial;
  WeatherModel? _weather;
  String? _errorMessage;

  WeatherStatus get status => _status;
  WeatherModel? get weather => _weather;
  String? get errorMessage => _errorMessage;

  Future<void> fetchWeather(String city) async{

    _status= WeatherStatus.loading;
    _weather = null;
    _errorMessage = null;
    notifyListeners();

    try{
      WeatherModel result = await _service.fetchWeather(city);
      _weather = result;
      _status = WeatherStatus.loaded;
    }
    catch(e){
      _weather = null;
      _status = WeatherStatus.error;
      _errorMessage = "Couldn't fetch";
    }
    notifyListeners();
  }

}