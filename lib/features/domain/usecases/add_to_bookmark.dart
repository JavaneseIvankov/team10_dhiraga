import 'package:flutter/material.dart';
import 'package:team10_dhiraga/core/usecases/usecases.dart';
import 'package:team10_dhiraga/features/domain/repositories/auth_repository.dart';
import 'package:team10_dhiraga/features/domain/repositories/user_repository.dart';

class AddToBookmark implements UseCase<void, AddToBookmarkParams> {
  final UserRepository _userRepository;
  final AuthRepository _authRepository;

  AddToBookmark(this._authRepository, this._userRepository);

  @override
  Future<void> call(AddToBookmarkParams params) async {
    try {
      final currentId = _authRepository.currentUser.id;
      await _userRepository.addBookmark(currentId, params.id);
      if (params.onSuccess != null) params.onSuccess!();
    } on Exception catch (e) {
      if (params.onFailed != null) params.onFailed!(e);
      rethrow;
    }
  }
}

class AddToBookmarkParams {
  String id;
  VoidCallback? onSuccess;
  ValueChanged<Exception>? onFailed;

  AddToBookmarkParams({required id, this.onSuccess, this.onFailed})
    : id = id ?? "";
}
