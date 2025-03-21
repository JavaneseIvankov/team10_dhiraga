import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:team10_dhiraga/di/injection_container.dart';
import 'package:team10_dhiraga/features/domain/repositories/auth_repository.dart';
import 'package:team10_dhiraga/features/domain/repositories/user_repository.dart';
import 'package:team10_dhiraga/pages/Navbar_home_page.dart/home_page.dart';
import 'package:team10_dhiraga/pages/form_mentor.dart';
import 'package:team10_dhiraga/pages/form_student.dart';
import 'package:team10_dhiraga/pages/login_page.dart';
import 'package:team10_dhiraga/pages/register_page.dart';

class AuthWrapper extends StatelessWidget {
  final List<Map<String, String>> savedNotifications;
  final Function(Map<String, String>) addNotification;
  final _userRepo = sl<UserRepository>();

  AuthWrapper({
    Key? key,
    this.savedNotifications = const [],
    this.addNotification = _defaultAddNotification, // Nilai default
  }) : super(key: key);

  static void _defaultAddNotification(Map<String, String> notification) {
    // Fungsi default jika tidak diberikan
  }

  Widget _navigateAuthenticatedUser(User? firebaseUser) {
    final id = firebaseUser?.uid ?? 'null';
    _userRepo.getUserById(id).then((user) {
      if (user != null) {
        if (user.isInitialized()) return HomePage();
        if (user.role == "student") return FormStudent();
        debugPrint("ELSE TIGGERED");
        return FormMentor();
      }
    });
    return LoginPage();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (snapshot.hasData) {
          _navigateAuthenticatedUser(snapshot.data);
          // return HomePage(
          //   savedNotifications: savedNotifications,
          //   addNotification: addNotification,
          // );
        }
        return LoginPage();
      },
    );
  }
}
