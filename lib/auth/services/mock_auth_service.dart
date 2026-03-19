import 'package:smart_home_v2/auth/models/auth_user.dart';
import 'package:smart_home_v2/auth/services/auth_service.dart';


class MockAuthService implements AuthService{

  MockAuthService();

  @override
  Future<AuthUser> login(String username, String password) async{
    await Future.delayed(Duration(seconds: 2));

    return AuthUser(id: "1", email: username);

  }

  @override
  Future<void> logout() async{
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Future<AuthUser?> getCurrentUser() async{
    await Future.delayed(Duration(seconds: 2));
    return AuthUser(id: "1", email: "username");
  }


}