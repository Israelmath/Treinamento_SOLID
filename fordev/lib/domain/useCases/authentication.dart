import 'package:flutter/material.dart';

import '../entities/account_entity.dart';

abstract class Authentication {

  Future<AccountEntity> auth(AuthenticationParams authenticationParams);

}

class AuthenticationParams {
  final String email;
  final String password;


  AuthenticationParams({required this.email, required this.password});
}