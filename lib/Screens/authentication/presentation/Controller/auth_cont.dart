import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:bachelor2/Screens/authentication/data/models/signup_user_req.dart';
import 'package:bachelor2/Screens/authentication/domain/usecases/signup.dart';
import 'package:bachelor2/Screens/client_page.dart';
import 'package:bachelor2/service_locator.dart';

class AuthController{
  static void SignUp(context,email, name, password, role) async {
  final request = new SignUpUserRequest(
      name: name, email: email, password: password, role: role);
  var result = await sl<SignupUseCase>().call(params: request);

  result.fold((l) => 'sign in unsuccessful', (r) => 
  Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ClientLoginPage()))  );
}
}
