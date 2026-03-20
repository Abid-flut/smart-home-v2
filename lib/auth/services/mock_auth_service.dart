import 'package:smart_home_v2/auth/models/auth_user.dart';
import 'package:smart_home_v2/auth/services/auth_service.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MockAuthService implements AuthService{

  MockAuthService();

  final _storage = const FlutterSecureStorage();



  @override
  Future<AuthUser> login(String username, String password) async {



    if (username == "admin" && password == "1234") {
      final user = AuthUser(id: "1", email: username);
      await _storage.write(key: "user", value: jsonEncode(user.toJson()));
      return user;
    } else {
      throw Exception("Invalid credentials");
    }


  }

  @override
  Future<void> logout() async{
    await _storage.delete(key: "user");
  }

  @override
  Future<AuthUser?> getCurrentUser() async{

    final jsonString = await _storage.read(key: "user");

    if(jsonString == null){
      return null;
    }

    final Map<String,dynamic> jsonMap = jsonDecode(jsonString) as Map<String,dynamic>;
      return AuthUser.fromJson(jsonMap);

  }

}
