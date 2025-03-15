import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:team10_dhiraga/features/data/models/auth_user_model.dart';

class FirebaseAuthService {
  final firebase_auth.FirebaseAuth _firebaseAuth;

  FirebaseAuthService({firebase_auth.FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  Future<AuthUserModel> register(String email, String password) async {
    try {
      // Create the user with email and password
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        // Sign in the user after successful registration
        await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        debugPrint("SERVICE: REGISTRASI BERHASIL");

        // Return the AuthUserModel after sign-in
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
        debugPrint("SERVICE: LOGIN BERHASIL");
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

  Stream<AuthUserModel?> onAuthStateChanges() {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      debugPrint(
        "SERVICE: USER AUTH STATUS CHANGED ${firebaseUser?.toString()}",
      );
      if (firebaseUser != null) {
        return AuthUserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email ?? '',
        );
      } else {
        return null;
      }
    });
  }
}
