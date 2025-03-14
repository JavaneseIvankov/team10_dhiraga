import 'package:get_it/get_it.dart';
import 'package:team10_dhiraga/features/data/datasources/firebase_auth_service.dart';
import 'package:team10_dhiraga/features/data/datasources/firestore_user_service.dart';
import 'package:team10_dhiraga/features/data/repositories/auth_repository_impl.dart';
import 'package:team10_dhiraga/features/data/repositories/user_repository_impl.dart';
import 'package:team10_dhiraga/features/domain/entities/auth_user_entity.dart';
import 'package:team10_dhiraga/features/domain/repositories/auth_repository.dart';
import 'package:team10_dhiraga/features/domain/repositories/user_repository.dart';
import 'package:team10_dhiraga/features/domain/usecases/login_user.dart';
import 'package:team10_dhiraga/features/domain/usecases/register_user.dart';
import 'package:team10_dhiraga/features/domain/usecases/use_user_stream.dart';
import 'package:team10_dhiraga/features/presentation/providers/auth_provider.dart';

final sl = GetIt.instance;

void setupDependencyInjection() {
  // sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Data Layer
  sl.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
  sl.registerLazySingleton<FirestoreUserService>(() => FirestoreUserService());

  // Repository Layer
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));

  // Use Cases
  sl.registerLazySingleton<LoginUser>(() => LoginUser(sl(), sl()));
  sl.registerLazySingleton<RegisterUser>(() => RegisterUser(sl(), sl()));
  sl.registerLazySingleton<UserStream>(() => UserStream(sl(), sl()));

  // Providers
  sl.registerLazySingleton<MyAuthProvider>(
    () => MyAuthProvider(loginUser: sl(), registerUser: sl()),
  );
}
