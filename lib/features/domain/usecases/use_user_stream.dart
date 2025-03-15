import 'dart:async';
import 'package:flutter/material.dart';
import 'package:team10_dhiraga/features/domain/entities/user_entity.dart';
import 'package:team10_dhiraga/features/domain/repositories/auth_repository.dart';
import 'package:team10_dhiraga/features/domain/repositories/user_repository.dart';

class UserStream {
  final AuthRepository authRepository;
  final UserRepository userRepository;
  final StreamController<UserEntity?> _userController =
      StreamController<UserEntity?>.broadcast();

  UserStream(this.authRepository, this.userRepository) {
    _initialize();
    debugPrint("USER STREAM: Is initialized");
  }

  Stream<UserEntity?> get userStream => _userController.stream;

  void _initialize() {
    authRepository.onAuthStateChanges().listen((authUser) async {
      debugPrint("USER STREAM: Auth state changed: ${authUser?.toString()}");
      if (authUser != null && authUser.id.isNotEmpty) {
        final user = await userRepository.getUser(authUser.id);
        debugPrint(
          "USER STREAM: User fetched from Firestore: ${user?.toJson() ?? "NULL"}",
        );
        _userController.add(user);
      } else {
        debugPrint("USER STREAM: Auth user is null or ID is empty");
        _userController.add(null);
      }
    });
  }

  void addUser(UserEntity? user) {
    _userController.add(user);
    debugPrint("User Stream: Adding user to stream $user");
  }

  void dispose() {
    _userController.close();
  }
}
