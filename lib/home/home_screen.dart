import 'package:flutter/material.dart';
import 'package:smart_home_v2/shared/app_bar.dart';
import 'package:smart_home_v2/weather/widgets/weather_card.dart';

class HomeScreen extends StatefulWidget{

  const HomeScreen({
    super.key
  });

  State<HomeScreen> createState() => _HomeScreenState();


}

class _HomeScreenState extends State<HomeScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF242B3A),
      appBar: MainAppBar(),
      body: WeatherCard()
    );
  }


}