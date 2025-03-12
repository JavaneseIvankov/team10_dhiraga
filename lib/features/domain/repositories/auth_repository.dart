import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<AuthUserEntity> login(String email, String password);
  Future<AuthUserEntity> register(String email, String password);
  Future<AuthUserEntity> getAuthStatus();
}
