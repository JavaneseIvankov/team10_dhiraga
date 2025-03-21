import 'package:team10_dhiraga/features/data/datasources/mentor_service.dart';
import 'package:team10_dhiraga/features/data/models/mentor_model.dart';
import 'package:team10_dhiraga/features/domain/entities/user_entity.dart';
import 'package:team10_dhiraga/features/domain/repositories/user_repository.dart';
import 'package:team10_dhiraga/features/data/datasources/firestore_user_service.dart';
import 'package:team10_dhiraga/features/data/models/student_update_params.dart';
import 'package:team10_dhiraga/features/data/models/mentor_update_params.dart';

class UserRepositoryImpl implements UserRepository {
  final FirestoreUserService firestoreUserService;
  final MentorService mentorService;

  UserRepositoryImpl(this.firestoreUserService, this.mentorService);

  @override
  Future<UserEntity?> createUser(String userId, String role) async {
    return await firestoreUserService.createUser(userId, role);
  }

  @override
  Future<UserEntity?> getUserById(String userId) async {
    return await firestoreUserService.getUser(userId);
  }

  @override
  Future<List<MentorModel>> getMentorWithQuery({
    required List<List<String>> query,
    int? limit,
  }) async {
    return await mentorService.getMentorsByMultiTags(
      multiTags: query,
      limit: limit,
    );
  }

  @override
  Future<void> addBookmark(String userId, String beasiswaId) async {
    return await firestoreUserService.addItemToArray(
      'bookmark',
      userId,
      beasiswaId,
    );
  }

  @override
  Future<void> removeBookmark(String userId, String beasiswaId) async {
    return await firestoreUserService.removeItemFromArray(
      'bookmark',
      userId,
      beasiswaId,
    );
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
