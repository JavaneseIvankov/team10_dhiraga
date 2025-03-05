import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

// Contoh inisialisasi firebase, nnti dihapus aja

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
