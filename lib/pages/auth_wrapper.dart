import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:team10_dhiraga/pages/Navbar_home_page.dart/home_page.dart';
import 'package:team10_dhiraga/pages/login_page.dart';

class AuthWrapper extends StatelessWidget {
  final List<Map<String, String>> savedNotifications;
  final Function(Map<String, String>) addNotification;

  const AuthWrapper({
    Key? key,
    this.savedNotifications = const [],
    this.addNotification = _defaultAddNotification, // Nilai default
  }) : super(key: key);

  static void _defaultAddNotification(Map<String, String> notification) {
    // Fungsi default jika tidak diberikan
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
          return HomePage(
            savedNotifications: savedNotifications,
            addNotification: addNotification,
          );
        }
        return LoginPage();
      },
    );
  }
}
