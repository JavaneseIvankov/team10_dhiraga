import 'package:flutter/widgets.dart';
import 'package:team10_dhiraga/features/domain/entities/auth_user_entity.dart';
import 'package:team10_dhiraga/features/domain/repositories/auth_repository.dart';
import 'package:team10_dhiraga/features/data/datasources/firebase_auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService firebaseAuthService;

  AuthRepositoryImpl(this.firebaseAuthService);

  @override
  Future<AuthUserEntity> login(String email, String password) async {
    return await firebaseAuthService.login(email, password);
  }

  @override
  Future<AuthUserEntity> register(String email, String password) async {
    return await firebaseAuthService.register(email, password);
  }

  @override
  Stream<AuthUserEntity?> onAuthStateChanges() {
    return firebaseAuthService.onAuthStateChanges().map((user) {
      if (user != null) {
        return AuthUserEntity(id: user.id, email: user.email);
      } else {
        return null;
      }
    });
  }
}
