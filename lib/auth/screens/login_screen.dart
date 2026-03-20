 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_v2/auth/auth_provider.dart';
import 'package:smart_home_v2/auth/auth_status.dart';

class LoginScreen extends StatefulWidget{

  const LoginScreen({
    super.key
  });

  State<LoginScreen> createState() => _LoginScreen();

}

class _LoginScreen extends State<LoginScreen>{


  final _formKey = GlobalKey<FormState>();
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final auth = context.watch<AuthProvider>();


    void login(){
      if(_formKey.currentState!.validate()){
        auth.login(_usernameController.text, _passwordController.text);
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFF242B3A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F2430),
        centerTitle: true,
        elevation: 0,
        title: Text("Login Screen",
        style: TextStyle(color: Colors.white70),
        ),
      ),
      body: Center(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _usernameController,
                    style: TextStyle(color: Colors.white70),
                    onChanged: (_) => auth.clearError() ,
                    decoration: InputDecoration(
                      hintText: "Username",
                      hintStyle: TextStyle(color: Colors.white70),
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Enter Username";
                      }
                      return null;},
                    ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: _passwordController,
                    onChanged: (_) => auth.clearError(),
                    style: TextStyle(color: Colors.white70),
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white70),
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Enter Password";
                      }
                      return null;},
                    ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                      onPressed: auth.status==AuthStatus.loading ? null : login,
                      child: auth.status == AuthStatus.loading ?
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      ) :Text("Login")
                  ),
                  SizedBox(height: 10),
                  if(auth.status == AuthStatus.error)
                    Text(auth.authError!,style: TextStyle(color: Colors.red),),
                ],
              ),
            )
        ),
      ),
    );
  }

}