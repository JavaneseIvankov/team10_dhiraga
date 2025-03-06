import 'package:team10_dhiraga/core/usecases/usecases.dart';
import 'package:team10_dhiraga/features/domain/entities/user_entity.dart';
import 'package:team10_dhiraga/features/domain/repositories/auth_repository.dart';

class RegisterUser implements UseCase<UserEntity, RegisterParams> {
  final AuthRepository repository;

  RegisterUser(this.repository);

  @override
  Future<UserEntity> call(RegisterParams params) async {
    return await repository.register(params.email, params.password);
  }
}

class RegisterParams {
  final String email;
  final String password;

  RegisterParams({required this.email, required this.password});
}
