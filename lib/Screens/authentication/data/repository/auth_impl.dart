import 'package:dartz/dartz.dart';
import 'package:bachelor2/Screens/authentication/data/models/signup_user_req.dart';
import 'package:bachelor2/Screens/authentication/data/sources/auth_firebase_service.dart';
import 'package:bachelor2/Screens/authentication/domain/repository/auth.dart';
import 'package:bachelor2/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(SignUpUserRequest request) async {
    return await sl<AuthFirebaseService>().signup(request);
  }
}
