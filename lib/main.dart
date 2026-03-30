import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_v2/auth/auth_gate.dart';

import 'package:smart_home_v2/auth/auth_provider.dart';

import 'package:smart_home_v2/auth/services/firebase_auth_service.dart';

import 'package:smart_home_v2/core/app_coordinator.dart';
import 'package:smart_home_v2/devices/device_provider.dart';

import 'package:smart_home_v2/devices/services/ha_device_service.dart';
import 'package:smart_home_v2/devices/services/mock_device_service.dart';

import 'package:smart_home_v2/weather/weather_provider.dart';
import 'package:smart_home_v2/weather/services/real_weather_service.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //MockAuthService mockAuth = MockAuthService();
  //MockWeatherService mockWeather = MockWeatherService();
  RealWeatherService realWeather = RealWeatherService();
  FirebaseAuthService authService = FirebaseAuthService();
  MockDeviceService mockDeviceService = MockDeviceService();
  runApp(
    MultiProvider(
        providers:[
          ChangeNotifierProvider(
              create: (_){
                final provider = AuthProvider(auth: authService);
                provider.restoreSession();
                return provider;
          },),
          ChangeNotifierProvider(create: (_)=>DeviceProvider(HaDeviceService())),
          ChangeNotifierProvider(create: (_)=>WeatherProvider(service: realWeather)),
          ProxyProvider2<AuthProvider,DeviceProvider,AppCoordinator>(
              update: (context, authProvider, deviceProvider, previous){
                return AppCoordinator(
                    authProvider: authProvider,
                    deviceProvider: deviceProvider);
              })
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

