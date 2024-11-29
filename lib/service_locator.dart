import 'package:get_it/get_it.dart';
import 'package:bachelor2/Screens/authentication/data/repository/auth_impl.dart';
import 'package:bachelor2/Screens/authentication/data/sources/auth_firebase_service.dart';
import 'package:bachelor2/Screens/authentication/domain/repository/auth.dart';
import 'package:bachelor2/Screens/authentication/domain/usecases/signup.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
}
