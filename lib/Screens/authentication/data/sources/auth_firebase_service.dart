import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bachelor2/Screens/authentication/data/models/signup_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(SignUpUserRequest s);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signup(SignUpUserRequest s) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: s.email,
        password: s.password,
      );

      await userCredential.user?.sendEmailVerification();

      return Right('Sign In was Successful');
    } catch (e) {
      print(e.toString());
      return Left('Sign In was Un Successful');
    }
  }
}
