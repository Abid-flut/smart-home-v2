
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_home_v2/auth/models/auth_user.dart';
import 'package:smart_home_v2/auth/services/auth_service.dart';

class FirebaseAuthService implements AuthService{


  Future<AuthUser> login(String username, String password) async{

    UserCredential? credential;

    try{
      credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: username, password: password);

    }
    catch(e){
      throw Exception("Invalid credentials");
    }
    if(credential.user == null){
      throw Exception("User not found");
    }
    return AuthUser(id: credential.user!.uid, email: credential.user?.email ?? '');

  }

  Future<void> logout() async{

    await FirebaseAuth.instance.signOut();

  }


  Future<AuthUser?> getCurrentUser() async{

    final user = FirebaseAuth.instance.currentUser;

    if(user == null){
      return null;
    }

    return AuthUser(id: user.uid, email: user.email ?? '');

  }

}