import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_home_v2/auth/auth_provider.dart';
import 'package:smart_home_v2/auth/auth_status.dart';
import 'package:smart_home_v2/auth/services/mock_auth_service.dart';
import 'package:smart_home_v2/devices/device_provider.dart';
import 'package:smart_home_v2/weather/weather_provider.dart';

void main(){

  MockAuthService mockAuth = MockAuthService();

  runApp(
    MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (_)=>AuthProvider(auth: mockAuth)),
          ChangeNotifierProvider(create: (_)=>DeviceProvider()),
          ChangeNotifierProvider(create: (_)=>WeatherProvider()),

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
      home: Scaffold(
        body: Center(
          child: auth.status==AuthStatus.loading?
            const CircularProgressIndicator():
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  auth.status==AuthStatus.authenticated? "Logged In" :
                  auth.status==AuthStatus.unauthenticated ?"Logged Out":
                  auth.status==AuthStatus.error ?"Authentication Error":"",
                style: TextStyle(fontSize: 20),
                ),
                if(auth.authError != null)
                  Text(auth.authError!,
                  style: TextStyle(color: Colors.red),),

                const SizedBox(height: 20),

                ElevatedButton(
                    onPressed:(){
                      auth.login("demo", "1234");
                }
                    , child: Text("Login")
                ),
                
                const SizedBox(height: 20),
                
                ElevatedButton(
                    onPressed: (){
                      auth.logout();
                    }, child: Text("Logout"))
              ],
            ),
        ),
      ),
    );
  }
}

