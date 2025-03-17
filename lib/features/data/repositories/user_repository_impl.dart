import 'package:team10_dhiraga/features/domain/entities/user_entity.dart';
import 'package:team10_dhiraga/features/domain/repositories/user_repository.dart';
import 'package:team10_dhiraga/features/data/datasources/firestore_user_service.dart';
import 'package:team10_dhiraga/features/data/models/student_update_params.dart';
import 'package:team10_dhiraga/features/data/models/mentor_update_params.dart';

class UserRepositoryImpl implements UserRepository {
  final FirestoreUserService firestoreUserService;

  UserRepositoryImpl(this.firestoreUserService);

  @override
  Future<UserEntity?> createUser(String userId, String role) async {
    return await firestoreUserService.createUser(userId, role);
  }

  @override
  Future<UserEntity?> getUser(String userId) async {
    return await firestoreUserService.getUser(userId);
  }

  @override
  Future<void> updateStudent(String userId, StudentUpdateParams params) async {
    await firestoreUserService.updateUser(userId, params.toJson());
  }

  @override
  Future<void> updateMentor(String userId, MentorUpdateParams params) async {
    await firestoreUserService.updateUser(userId, params.toJson());
  }

  @override
  Future<void> deleteUser(String userId) async {
    await firestoreUserService.deleteUser(userId);
  }
}
