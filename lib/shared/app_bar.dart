import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_v2/auth/auth_provider.dart';
import 'package:smart_home_v2/auth/auth_status.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget{

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  
  @override
  Widget build(BuildContext context) {

    final auth = Provider.of<AuthProvider>(context);
    final user = auth.user;
    
    void logout(){
      auth.logout();
    }
    
    return AppBar(
      backgroundColor: const Color(0xFF1F2430),
      elevation: 0,
      centerTitle: true,
      title: Text("Home( ${user?.email} )",
          style: TextStyle(color: Colors.white)
      ),
      actions: [
        IconButton(onPressed: auth.status == AuthStatus.loading ? null : logout, icon: Icon(Icons.logout,color: Colors.white70,),)
      ],
    );
  }

}