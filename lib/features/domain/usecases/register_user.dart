import 'package:team10_dhiraga/core/usecases/usecases.dart';
import 'package:team10_dhiraga/features/domain/entities/auth_user_entity.dart';
import 'package:team10_dhiraga/features/domain/repositories/auth_repository.dart';
import 'package:team10_dhiraga/features/domain/repositories/user_repository.dart';

class RegisterUser implements UseCase<AuthUserEntity, RegisterParams> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  RegisterUser(this._authRepository, this._userRepository);

  @override
  Future<AuthUserEntity> call(RegisterParams params) async {
    AuthUserEntity authUser = await _authRepository.register(
      params.email,
      params.password,
    );
    await _userRepository.createUser(authUser.id, params.role);
    return authUser;
  }
}

class RegisterParams {
  final String email;
  final String password;
  final String role;

  RegisterParams({
    required this.email,
    required this.password,
    required this.role,
  });
}
