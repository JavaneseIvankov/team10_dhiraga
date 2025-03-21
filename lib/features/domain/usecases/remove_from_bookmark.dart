import 'package:flutter/material.dart';
import 'package:team10_dhiraga/core/usecases/usecases.dart';
import 'package:team10_dhiraga/features/domain/repositories/auth_repository.dart';
import 'package:team10_dhiraga/features/domain/repositories/user_repository.dart';

class RemoveFromBookmark implements UseCase<void, RemoveFromBookmarkParams> {
  final UserRepository _userRepository;
  final AuthRepository _authRepository;

  RemoveFromBookmark(this._authRepository, this._userRepository);

  @override
  Future<void> call(RemoveFromBookmarkParams params) async {
    try {
      final currentId = _authRepository.currentUser.id;
      await _userRepository.removeBookmark(currentId, params.id);
      if (params.onSuccess != null) params.onSuccess!();
    } on Exception catch (e) {
      if (params.onFailed != null) params.onFailed!(e);
      rethrow;
    }
  }
}

class RemoveFromBookmarkParams {
  String id;
  VoidCallback? onSuccess;
  ValueChanged<Exception>? onFailed;

  RemoveFromBookmarkParams({required id, this.onSuccess, this.onFailed})
    : id = id ?? "";
}
