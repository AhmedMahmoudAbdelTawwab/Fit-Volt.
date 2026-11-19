import 'package:fit_volt/feature/auth/sign_up/domain/entitty/user_entitty.dart';

class UserDto {
  UserDto({this.email, this.name, this.password, required this.id});
  String? name;
  String? email;
  String? password;
  String id;
  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      email: json["email"] as String,
      id: json["id"] as String,
      name: json["name"] as String,
      password: json["password"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {"email": email, "id": id, "name": name, "password": password};
  }

  UserEntitty toEntitty() {
    return UserEntitty(
      email: email ?? '',
      name: name ?? '',
      password: password ?? '',
    );
  }
}
