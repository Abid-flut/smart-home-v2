import 'package:flutter/material.dart';
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
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F2430),
        elevation: 0,
        centerTitle: true,
        title: const Text("HomeScreen",
        style: TextStyle(color: Colors.white)
        ),
      ),
      body: ListView(
        children: [
          WeatherCard(),
        ],
      ),
    );
  }


}