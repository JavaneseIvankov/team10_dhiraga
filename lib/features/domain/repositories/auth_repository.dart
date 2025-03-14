import '../entities/auth_user_entity.dart';

abstract class AuthRepository {
  Future<AuthUserEntity> login(
    String email,
    String password,
  ); // DO NOT CALL IN PAGE / VIEW LAYER, USE USECASE INSTEAD
  Future<AuthUserEntity> register(
    String email,
    String password,
  ); // DO NOT CALL IN PAGE / VIEW LAYER, USE USECASE INSTEAD
  Future<AuthUserEntity> getAuthStatus();
}
