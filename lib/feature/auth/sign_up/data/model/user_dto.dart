import 'package:fit_volt/feature/auth/sign_up/domain/entitty/user_entitty.dart';

class UserDto {
  UserDto({this.email, this.name, this.password, required this.id});
  String? name;
  String? email;
  String? password;
  String id;
  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(email: json["email"] as String, id: json["uid"] as String);
  }

  Map<String, dynamic> toJson() {
    return {"email": email, "uid": id};
  }

  UserEntitty toEntitty() {
    return UserEntitty(
      email: email ?? '',
      name: name ?? '',
      password: password ?? '',
    );
  }
}
