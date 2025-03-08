import 'package:flutter/material.dart';
import 'package:team10_dhiraga/features/domain/usecases/login_user.dart';
import 'package:team10_dhiraga/features/domain/usecases/register_user.dart';
import 'package:team10_dhiraga/pages/Navbar_home_page.dart/home_page.dart';

class MyAuthProvider with ChangeNotifier {
  final LoginUser loginUser;
  final RegisterUser registerUser;

  String? _userId;

  MyAuthProvider({required this.loginUser, required this.registerUser});

  bool _isLoading = false;
  String _errorMessage = "";

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> login({
    required email,
    required password,
    VoidCallback? onSuccess,
    VoidCallback? onFailed,
  }) async {
    _setLoading(true);
    _clearError();
    try {
      await loginUser(LoginParams(email: email, password: password));
      onSuccess!();
    } catch (e) {
      _setError("Login gagal, coba lagi!");
      onFailed!();
    } finally {
      _setLoading(false);
    }
  }

  Future<void> register({
    required email,
    required password,
    VoidCallback? onSuccess,
    VoidCallback? onFailed,
  }) async {
    _setLoading(true);
    _clearError();
    try {
      await registerUser(RegisterParams(email: email, password: password));
      onSuccess!();
    } catch (e) {
      _setError("Registrasi gagal, coba lagi!");
      onFailed!();
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = "";
  }
}
