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
  }
}
