import 'package:dartz/dartz.dart';
import 'package:bachelor2/Screens/authentication/data/models/signup_user_req.dart';

abstract class AuthRepository {
  Future<Either> signup(SignUpUserRequest request);

}
