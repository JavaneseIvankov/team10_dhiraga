import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team10_dhiraga/features/domain/entities/user_entity.dart';
import 'package:team10_dhiraga/features/domain/repositories/auth_repository.dart';
import 'package:team10_dhiraga/features/domain/repositories/user_repository.dart';
import 'package:team10_dhiraga/features/data/models/student_update_params.dart';
import 'package:team10_dhiraga/features/data/models/mentor_update_params.dart';
import 'package:team10_dhiraga/features/domain/usecases/get_mentors.dart';

class UserProvider with ChangeNotifier {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  UserProvider({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  }) : _userRepository = userRepository,
       _authRepository = authRepository;

  Stream<UserEntity?> get userStream {
    return _authRepository.onAuthStateChanges().asyncMap((authUser) async {
      if (authUser != null && authUser.id.isNotEmpty) {
        final user = await _userRepository.getUserById(authUser.id);
        debugPrint("\n USER CHANGED: ${user?.toJson() ?? "NULL"} \n");
        return user;
      } else {
        debugPrint("\n USER CHANGED TO NULL!!! \n");
        return null;
      }
    });
  }

  Future<UserEntity?> get currentUser async {
    final authUser = _authRepository.currentUser;
    if (authUser.id.isNotEmpty) {
      return await _userRepository.getUserById(authUser.id);
    }
    return null;
  }

  Future<UserEntity?> getUserById(String id) async {
    return await _userRepository.getUserById(id);
  }

  Future<UserEntity?> createUser(String userId, String role) async {
    return await _userRepository.createUser(userId, role);
  }

  Future<void> updateStudent(String userId, StudentUpdateParams params) async {
    await _userRepository.updateStudent(userId, params);
  }

  Future<void> updateMentor(String userId, MentorUpdateParams params) async {
    await _userRepository.updateMentor(userId, params);
  }

  Future<void> deleteUserPermanently(String userId) async {
    await _userRepository.deleteUser(userId);
  }

  Future<List<UserEntity>> getMentors(GetMentorParams params) async {
    return await _userRepository.getMentorWithQuery(
      query: params.toList(),
      limit: 20,
    );
  }
}
