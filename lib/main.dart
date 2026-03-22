import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_v2/auth/auth_gate.dart';

import 'package:smart_home_v2/auth/auth_provider.dart';
import 'package:smart_home_v2/auth/auth_status.dart';
import 'package:smart_home_v2/auth/screens/login_screen.dart';
import 'package:smart_home_v2/auth/services/mock_auth_service.dart';
import 'package:smart_home_v2/devices/device_provider.dart';
import 'package:smart_home_v2/weather/services/mock_weather_service.dart';
import 'package:smart_home_v2/weather/weather_provider.dart';
import 'package:smart_home_v2/weather/services/real_weather_service.dart';
import 'home/home_screen.dart';

void main(){

  MockAuthService mockAuth = MockAuthService();
  MockWeatherService mockWeather = MockWeatherService();
  RealWeatherService realWeather = RealWeatherService();

  runApp(
    MultiProvider(
        providers:[
          ChangeNotifierProvider(
              create: (_){
                final provider = AuthProvider(auth: mockAuth);
                provider.restoreSession();
                return provider;
          },),
          ChangeNotifierProvider(create: (_)=>DeviceProvider(_service)),
          ChangeNotifierProvider(create: (_)=>WeatherProvider(service: realWeather)),

        ],
        child: const MyApp(),
    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {

    AuthProvider auth = context.watch<AuthProvider>();
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}

