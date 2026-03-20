
class AuthUser{

  final String id;
  final String email;

  AuthUser({
    required this.id,
    required this.email,
  });

  Map<String,dynamic> toJson(){

    return {
      "id" : id,
      "email" : email
    };

  }

  factory AuthUser.fromJson(Map<String, dynamic> json){

    return AuthUser(
        id: json["id"],
        email: json["email"]
    );

  }

}