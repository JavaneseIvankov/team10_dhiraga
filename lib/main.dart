import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team10_dhiraga/di/injection_container.dart';
import 'package:team10_dhiraga/pages/form_student.dart';
import 'package:team10_dhiraga/pages/login_page.dart';
import 'package:team10_dhiraga/features/presentation/providers/auth_provider.dart'
    as local;
import 'package:team10_dhiraga/core/services/firebase_initializer.dart';
import 'package:team10_dhiraga/core/theme/app_theme.dart';
import 'package:team10_dhiraga/pages/Navbar_home_page.dart/home_page.dart';
import 'package:team10_dhiraga/pages/landing_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:team10_dhiraga/features/domain/entities/user_entity.dart';
import 'package:team10_dhiraga/features/domain/usecases/use_user_stream.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseInitializer.initialize();
  setupDependencyInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> _hasSeenLandingPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('hasSeenLanding') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<local.MyAuthProvider>(
          create: (_) => sl<local.MyAuthProvider>(),
        ),
        StreamProvider<UserEntity?>(
          create: (context) => sl<UserStream>().userStream,
          initialData: null,
        ),
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
            return AuthWrapper();
          },
        ),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserEntity?>(context);
    debugPrint("\n MAIN: USER CHANGE DETECTED ${user.toString()} \n");

    if (user != null && user.id.isNotEmpty) {
      if (!user.isInitialized()) return FormStudent();
      return HomePage();
    }

    return LoginPage();
  }
}
