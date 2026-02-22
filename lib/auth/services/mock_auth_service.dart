import 'package:smart_home_v2/auth/services/auth_service.dart';


class MockAuthService implements AuthService{

  MockAuthService();

  @override
  Future<void> login(String username, String password) async{
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Future<void> logout() async{
    await Future.delayed(Duration(seconds: 2));
  }



}