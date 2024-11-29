import 'package:dartz/dartz.dart';
import 'package:bachelor2/core/usecase/usecase.dart';
import 'package:bachelor2/service_locator.dart';

import '../../data/models/signup_user_req.dart';
import '../repository/auth.dart';

class SignupUseCase implements Usecase<Either, SignUpUserRequest> {
  @override
  Future<Either> call({SignUpUserRequest? params}) async {
    
    return await sl<AuthRepository>().signup(params!);
  }
}
