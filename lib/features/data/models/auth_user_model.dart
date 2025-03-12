import 'package:team10_dhiraga/features/domain/entities/user_entity.dart';

class AuthUserModel extends UserEntity {
  AuthUserModel({required super.id, required super.email});

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(id: json['uid'], email: json['email']);
  }

  Map<String, dynamic> toJson() {
    return {'uid': id, 'email': email};
  }
}
