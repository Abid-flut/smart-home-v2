import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_v2/auth/auth_provider.dart';

class WelcomeText extends StatelessWidget{

  final String? email;

  const WelcomeText({super.key,required this.email});

  @override
  Widget build(BuildContext context) {



    return Column(
      children: [
        Text("Welcome, ${email ??'Guest'}",
          style: TextStyle(
            color: Colors.white70,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }


}