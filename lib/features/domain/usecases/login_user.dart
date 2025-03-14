import 'package:team10_dhiraga/core/usecases/usecases.dart';
import 'package:team10_dhiraga/features/domain/entities/user_entity.dart';
import 'package:team10_dhiraga/features/domain/repositories/user_repository.dart';
import '../repositories/auth_repository.dart';

class LoginUser implements UseCase<UserEntity?, LoginParams> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  LoginUser(this._authRepository, this._userRepository);

  @override
  Future<UserEntity?> call(LoginParams params) async {
    if (params.email.isEmpty || params.password.isEmpty) {
      throw Exception('Email and Password cannot be empty');
    }
    var authUser = await _authRepository.login(params.email, params.password);
    return _userRepository.getUser(authUser.id);
  }
}

class LoginParams {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});
}
