import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team10_dhiraga/features/presentation/providers/user_provider.dart';
import 'package:team10_dhiraga/pages/auth_wrapper.dart';
import 'di/injection_container.dart';
import 'pages/form_student.dart';
import 'pages/login_page.dart';
import 'package:team10_dhiraga/features/presentation/providers/auth_provider.dart'
    as local;
import 'package:team10_dhiraga/core/services/firebase_initializer.dart';
import 'package:team10_dhiraga/core/theme/app_theme.dart';
import 'package:team10_dhiraga/pages/Navbar_home_page.dart/home_page.dart';
import 'package:team10_dhiraga/pages/landing_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:team10_dhiraga/features/domain/entities/user_entity.dart';
import 'package:team10_dhiraga/features/domain/usecases/use_user_stream.dart';
import 'package:team10_dhiraga/temp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseInitializer.initialize();
  setupDependencyInjection();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, String>> _savedNotifications = [];

  Future<bool> _hasSeenLandingPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('hasSeenLanding') ?? false;
  }

  void _addNotification(Map<String, String> event) {
    setState(() {
      _savedNotifications.add(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<local.MyAuthProvider>(
          create: (_) => sl<local.MyAuthProvider>(),
        ),
        ChangeNotifierProvider<UserProvider>(create: (_) => sl<UserProvider>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        home: FutureBuilder<bool>(
          future: _hasSeenLandingPage(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            }
            if (snapshot.data == false) {
              return LandingPage();
            }
            return AuthWrapper(
              savedNotifications: _savedNotifications,
              addNotification: _addNotification,
            );
          },
        ),
      ),
    );
  }
}
