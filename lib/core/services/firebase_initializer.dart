import 'package:firebase_core/firebase_core.dart';
import 'package:team10_dhiraga/core/services/firebase_options.dart';

class FirebaseInitializer {
  static Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
