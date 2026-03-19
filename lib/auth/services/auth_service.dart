import 'package:smart_home_v2/auth/models/auth_user.dart';

abstract class AuthService {

  Future<AuthUser> login(String username,String password) ;

  Future<void> logout() ;

  Future<AuthUser?> getCurrentUser();

}
