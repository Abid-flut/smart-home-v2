import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_v2/weather/weather_status.dart';
import '../weather_provider.dart';

class WeatherCard extends StatefulWidget{

  const WeatherCard({
    super.key
  });

  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard>{

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherProvider>().fetchWeather("Bucharest");
    });
  }


  @override
  Widget build(BuildContext context) {

    final WeatherProvider weather = context.watch<WeatherProvider>();

    Widget header = Text(
      "Weather",
      style: TextStyle(
        color: Colors.white,
        fontSize: 20
      ),
    );

    Widget content;

    if(weather.status ==WeatherStatus.loading){
      content = Center(
        child: content = CircularProgressIndicator(),
      );
    }
    else if(weather.status ==WeatherStatus.loaded){
      final data = weather.weather!;
      content = Column(
        children: [
          Text(data.city,style: TextStyle(color: Colors.white,fontSize: 30),),
          SizedBox(height: 10,),
          Image.network("https://openweathermap.org/img/wn/${data.iconCode}@2x.png",),
          SizedBox(height: 10,),
          Text(data.condition,style: TextStyle(color: Colors.white70,fontSize: 18),),
          SizedBox(height: 10,),
          Text("${data.temperature}°C",style: TextStyle(color: Colors.white,fontSize: 50),),
        ],
      );
    }
    else if(weather.status == WeatherStatus.error){
      content = Column(
        children: [
          Text("${weather.errorMessage}",style: TextStyle(color: Colors.red,fontSize: 20),),
          SizedBox(height: 10,),
          ElevatedButton(
              onPressed:(){context.read<WeatherProvider>().fetchWeather("Bucharest");} ,
              child: Text("Retry"))
      
        ],
      );
    }
    else{
      content = SizedBox();
    }
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: 400,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.9),
            blurRadius: 40,
            spreadRadius: 8,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF3B4252),
                Color(0xFF2E3440),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: RefreshIndicator(
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Center(
                  child:Column(
                    children: [
                      header,
                      SizedBox(height:10),
                      content
                    ],
                  ) ,
                ),
                ),

              onRefresh: () async {
                return context.read<WeatherProvider>().fetchWeather("Bucharest");
              }
          )
        ),
      ),
    );
  }

}

