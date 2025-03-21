import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:team10_dhiraga/core/services/supabase_initializer.dart';
import 'package:team10_dhiraga/features/presentation/providers/user_provider.dart';
import 'package:team10_dhiraga/pages/auth_wrapper.dart';
import 'di/injection_container.dart';
import 'package:team10_dhiraga/features/presentation/providers/auth_provider.dart'
    as local;
import 'package:team10_dhiraga/core/services/firebase_initializer.dart';
import 'package:team10_dhiraga/core/theme/app_theme.dart';
import 'package:team10_dhiraga/pages/landing_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseInitializer.initialize();
  await SupabaseInitializer.initialize();
  setupDependencyInjection();
  initializeDateFormatting('id');
  // await DangerousTestingCommand();
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
        ChangeNotifierProvider<UserProvider>(create: (_) => sl<UserProvider>()),
        // StreamProvider<UserEntity?>(
        //   create: (context) => sl<UserStream>().userStream,
        //   initialData: null,
        // ),
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

// // TODO: Add spinner state compatibility
// class AuthWrapper extends StatelessWidget {
//   const AuthWrapper({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var user = Provider.of<UserEntity?>(context);
//     debugPrint("AuthWrapper is rebuilding");
//     debugPrint("\n MAIN: USER CHANGE DETECTED ${user.toString()} \n");
//     if (user != null && user.id.isNotEmpty) {
//       if (!user.isInitialized()) return FormStudent();
//       return HomePage();
//     }
//     return LoginPage();
//   }
// }
