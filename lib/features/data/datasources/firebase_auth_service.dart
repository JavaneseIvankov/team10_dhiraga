import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:team10_dhiraga/features/data/models/auth_user_model.dart';

class FirebaseAuthService {
  final firebase_auth.FirebaseAuth _firebaseAuth;

  FirebaseAuthService({firebase_auth.FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  Future<AuthUserModel> register(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        return AuthUserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email ?? '',
        );
      } else {
        throw Exception('User registration failed');
      }
    } catch (e) {
      throw Exception('Error registering user: $e');
    }
  }

  Future<AuthUserModel> login(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        return AuthUserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email ?? '',
        );
      } else {
        throw Exception('User login failed');
      }
    } catch (e) {
      print("Login Error: $e");
      throw Exception('Error logging in user: $e');
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
