import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_v2/auth/auth_provider.dart';
import 'package:smart_home_v2/auth/auth_status.dart';
import 'package:smart_home_v2/home/home_screen.dart';

class AuthGate extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final auth = Provider.of<AuthProvider>(context);

    if(auth.status==AuthStatus.loading){
      return Center(child: CircularProgressIndicator(),);
    }
    else if(auth.status ==AuthStatus.checkingSession){
      return Center(child: CircularProgressIndicator(),);
    }
    else if(auth.status == AuthStatus.unauthenticated){
      return Scaffold(
        body: Center(child: Text("Login Screen")),
      );
    }
    else if(auth.status == AuthStatus.authenticated){
      return HomeScreen();
    }
    else{
      return SizedBox();
    }

  }


}