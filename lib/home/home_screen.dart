import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_v2/auth/auth_provider.dart';
import 'package:smart_home_v2/debug/websocket_test.dart';
import 'package:smart_home_v2/devices/device_provider.dart';
import 'package:smart_home_v2/devices/services/ha_websocket_service.dart';
import 'package:smart_home_v2/devices/widgets/devices_card.dart';
import 'package:smart_home_v2/devices/widgets/devices_list.dart';
import 'package:smart_home_v2/shared/app_bar.dart';
import 'package:smart_home_v2/shared/welcome_text.dart';
import 'package:smart_home_v2/weather/widgets/weather_card.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomeScreen extends StatefulWidget{

  const HomeScreen({
    super.key
  });

  State<HomeScreen> createState() => _HomeScreenState();


}

class _HomeScreenState extends State<HomeScreen>{

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<DeviceProvider>().fetchDevices();
    });
  }

  @override
  Widget build(BuildContext context) {

    final user = context.watch<AuthProvider>().user;
    final deviceProvider = context.watch<DeviceProvider>();

    return Scaffold(
      backgroundColor: const Color(0xFF242B3A),
      appBar: MainAppBar(),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WelcomeText(email: user!.email,),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: HaWebSocketService().connect, child: Text("Test WebSocket")),
                SizedBox(height: 10,),
                WeatherCard(),
                SizedBox(height: 10,),
                DevicesCard(),
              ],
            ),
          )
      )
    );
  }


}