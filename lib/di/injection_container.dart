import 'package:get_it/get_it.dart';
import 'package:team10_dhiraga/features/data/datasources/firebase_auth_service.dart';
import 'package:team10_dhiraga/features/data/repositories/auth_repository_impl.dart';
import 'package:team10_dhiraga/features/domain/repositories/auth_repository.dart';
import 'package:team10_dhiraga/features/domain/usecases/login_user.dart';
import 'package:team10_dhiraga/features/domain/usecases/register_user.dart';
import 'package:team10_dhiraga/features/presentation/providers/auth_provider.dart';

final sl = GetIt.instance;

void setupDependencyInjection() {
  // sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Data Layer
  sl.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());

  // Repository Layer
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Use Cases
  sl.registerLazySingleton<LoginUser>(() => LoginUser(sl()));
  sl.registerLazySingleton<RegisterUser>(() => RegisterUser(sl()));

  // Providers
  sl.registerLazySingleton<AuthProvider>(
    () => AuthProvider(loginUser: sl(), registerUser: sl()),
  );
}
