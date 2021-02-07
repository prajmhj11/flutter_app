import 'package:flutter/foundation.dart';
import 'package:flutter_app/repositories/auth_repository.dart';

class AuthState {
  final AuthRepisotory _authRepisotory;

  AuthState(this._authRepisotory) : assert(_authRepisotory != null);

  Future signIn({
    @required String email,
    @required String password,
  }) async {
    await _authRepisotory.signIn(email: email, password: password);
  }

  Future signUp({
    @required String firstName,
    @required String lastName,
    @required String email,
    @required String password,
    @required String passwordConfirmation,
  }) async {
    await _authRepisotory.signUp(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      passwordConfirmation: passwordConfirmation,
    );
  }

  Future logOut() async {
    await _authRepisotory.logOut();
  }
}
