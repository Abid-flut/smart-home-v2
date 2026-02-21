import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_home_v2/auth/auth_provider.dart';
import 'package:smart_home_v2/devices/device_provider.dart';
import 'package:smart_home_v2/weather/weather_provider.dart';

void main(){

  runApp(
    MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (_)=>AuthProvider()),
          ChangeNotifierProvider(create: (_)=>DeviceProvider()),
          ChangeNotifierProvider(create: (_)=>WeatherProvider()),

        ],
        child: const MyApp(),
    ),
  );

}

