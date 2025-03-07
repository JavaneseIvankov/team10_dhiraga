import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team10_dhiraga/di/injection_container.dart';
import 'package:team10_dhiraga/pages/login_page.dart';
import 'package:team10_dhiraga/features/presentation/screen/register_screen.dart';
import 'package:team10_dhiraga/features/presentation/providers/auth_provider.dart';
import 'package:team10_dhiraga/core/services/firebase_initializer.dart';
import 'package:team10_dhiraga/pages/register_page.dart';
import 'package:team10_dhiraga/core/theme/app_theme.dart';

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
        ChangeNotifierProvider<AuthProvider>(create: (_) => sl<AuthProvider>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        home: LoginPage(),
      ),
    );
  }
}
