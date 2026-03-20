import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_v2/auth/auth_provider.dart';
import 'package:smart_home_v2/auth/auth_status.dart';
import 'package:smart_home_v2/auth/screens/login_screen.dart';
import 'package:smart_home_v2/home/home_screen.dart';

class AuthGate extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final auth = Provider.of<AuthProvider>(context);

    if(auth.status==AuthStatus.loading||auth.status==AuthStatus.checkingSession){
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    else if(auth.status ==AuthStatus.checkingSession){
      return Center(child: CircularProgressIndicator(),);
    }
    else if(auth.status == AuthStatus.unauthenticated || auth.status == AuthStatus.error){
      return LoginScreen();
    }
    else if(auth.status == AuthStatus.authenticated){
      return HomeScreen();
    }
    else{
      return SizedBox();
    }

  }


}