import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team10_dhiraga/di/injection_container.dart';
import 'package:team10_dhiraga/pages/login_page.dart';
import 'package:team10_dhiraga/features/presentation/screen/register_screen.dart';
import 'package:team10_dhiraga/features/presentation/providers/auth_provider.dart'
    as local;
import 'package:team10_dhiraga/core/services/firebase_initializer.dart';
import 'package:team10_dhiraga/core/theme/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:team10_dhiraga/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseInitializer.initialize();
  setupDependencyInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<local.AuthProvider>(
          create: (_) => sl<local.AuthProvider>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        home: AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (snapshot.hasData) {
          return HomePage();
        }
        return LoginPage();
      },
    );
  }
}
