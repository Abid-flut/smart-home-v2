import "package:flutter/material.dart";
import "package:smart_home_v2/auth/auth_status.dart";
import "package:smart_home_v2/auth/models/auth_user.dart";
import "package:smart_home_v2/auth/services/auth_service.dart";


class AuthProvider extends ChangeNotifier{

  final AuthService _auth;


  AuthProvider({
    required AuthService auth,
  }) : _auth = auth;

  AuthStatus _status = AuthStatus.unauthenticated;
  String? _authError;
  AuthUser? _user;

  AuthUser? get user => _user;
  String? get authError => _authError;
  AuthStatus get status => _status;

  Future<void> login(String username,String password) async{

    _authError = null;
    _status = AuthStatus.loading;
    notifyListeners();

    try{
      _user = await _auth.login(username, password);
      _status = AuthStatus.authenticated;
    }
    catch(e){
      _status = AuthStatus.error;
      _authError = "Couldn't log in";
    }

    notifyListeners();
  }

  Future<void> logout() async{

    _authError = null;
    _status = AuthStatus.loading;
    notifyListeners();

    try{
      await _auth.logout();
      _status = AuthStatus.unauthenticated;
      _user = null;
    }
    catch(e){
      _status = AuthStatus.error;
      _authError = "Logout Failed";
    }
    notifyListeners();
  }

  Future<void> restoreSession() async{

    _status = AuthStatus.checkingSession;
    notifyListeners();

    _user = await _auth.getCurrentUser();

    if(_user!=null){
      _status = AuthStatus.authenticated;
    }
    else{
      _status = AuthStatus.unauthenticated;
    }
    notifyListeners();

  }
}

