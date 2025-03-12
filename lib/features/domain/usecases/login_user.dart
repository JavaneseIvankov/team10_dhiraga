import 'package:team10_dhiraga/core/usecases/usecases.dart';
import 'package:team10_dhiraga/features/domain/entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginUser implements UseCase<AuthUserEntity, LoginParams> {
  final AuthRepository repository;

  LoginUser(this.repository);

  @override
  Future<AuthUserEntity> call(LoginParams params) async {
    if (params.email.isEmpty || params.password.isEmpty) {
      throw Exception('Email and Password cannot be empty');
    }
    return repository.login(params.email, params.password);
  }
}

class LoginParams {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});
}
