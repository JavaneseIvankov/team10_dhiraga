<<<<<<< HEAD
import 'package:team10_dhiraga/features/data/models/auth_user_model.dart';

class AuthUserModel {
  final String id;
  final String email;

  AuthUserModel({required this.id, required this.email});

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(id: json['id'] ?? '', email: json['email'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'email': email};
=======
import 'package:team10_dhiraga/features/domain/entities/auth_user_entity.dart';

class AuthUserModel extends AuthUserEntity {
  AuthUserModel({required super.id, required super.email});

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(id: json['uid'], email: json['email']);
  }

  Map<String, dynamic> toJson() {
    return {'uid': id, 'email': email};
>>>>>>> fbc2938bacd696fc3a3d3fec73c6b5fd6b41328f
  }
}
