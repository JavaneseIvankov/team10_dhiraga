import 'package:team10_dhiraga/features/domain/entities/user_entity.dart';
import 'package:team10_dhiraga/features/domain/repositories/auth_repository.dart';
import 'package:team10_dhiraga/features/domain/repositories/user_repository.dart';

class UserStream {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  UserStream(this.authRepository, this.userRepository);

  Stream<UserEntity?> get userStream {
    return authRepository.onAuthStateChanges().asyncMap((authUser) async {
      if (authUser != null && authUser.id.isNotEmpty) {
        return await userRepository.getUser(authUser.id);
      } else {
        return null;
      }
    });
  }
}
