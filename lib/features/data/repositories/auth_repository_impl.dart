import 'package:team10_dhiraga/features/domain/entities/user_entity.dart';
import 'package:team10_dhiraga/features/domain/repositories/auth_repository.dart';

import '../datasources/firebase_auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService firebaseAuthService;

  AuthRepositoryImpl(this.firebaseAuthService);

  @override
  Future<AuthUserEntity> login(String email, String password) async {
    final user = await firebaseAuthService.login(email, password);
    return AuthUserEntity(id: user.id, email: user.email);
  }

  @override
  Future<AuthUserEntity> register(String email, String password) async {
    final user = await firebaseAuthService.register(email, password);
    return AuthUserEntity(id: user.id, email: user.email);
  }

  @override
  Future<AuthUserEntity> getAuthStatus() {
    // TODO: implement getAuthStatus
    throw UnimplementedError();
  }
}
