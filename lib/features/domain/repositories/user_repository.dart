import 'package:team10_dhiraga/features/data/models/mentor_model.dart';
import 'package:team10_dhiraga/features/data/models/mentor_update_params.dart';
import 'package:team10_dhiraga/features/data/models/student_update_params.dart';
import 'package:team10_dhiraga/features/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity?> createUser(String userId, String role);
  Future<UserEntity?> getUserById(String userId);
  Future<List<MentorModel>> getMentorWithQuery({
    required List<List<String>> query,
    int? limit,
  });
  Future<void> updateStudent(String userId, StudentUpdateParams params);
  Future<void> updateMentor(String userId, MentorUpdateParams params);
  Future<void> deleteUser(String userId);
  Future<void> addBookmark(String userId, String beasiswaId);
  Future<void> removeBookmark(String userId, String beasiswaId);
}
