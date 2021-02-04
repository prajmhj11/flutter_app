import 'package:flutter_app/application/classes/errors/common_error.dart';
import 'package:flutter_app/state/auth_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SignInFormModel {
  final AuthState _authState = Injector.get<AuthState>();

  String email;
  String password;

  void setEmail(String email) {
    if (email != '') {
      // email validation
      if (!validateEmail(email)) {
        print(email);
        throw CommonErrors("Invalid email");
      }
    }
    this.email = email;
  }

  void setPassword(String password) {
    if (password != '') {
      // password validation
      if (password.length < 6) {
        throw CommonErrors("Password must be of length 6 or more");
      }
    }
    this.password = password;
  }

  bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool validateData() {
    return this.email != null &&
        this.password != null &&
        this.password.length >= 6 &&
        this.validateEmail(this.email);
  }

  submitSignIn() async {
    await _authState.signIn(email: this.email, password: this.password);
  }
}
