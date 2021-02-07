import 'package:flutter_app/application/classes/errors/common_error.dart';
import 'package:flutter_app/state/auth_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SignUpFormModel {
  final AuthState _authState = Injector.get<AuthState>();

  String firstName;
  String lastName;
  String email;
  String password;
  String passwordConfirmation;

  void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  void setLastName(String lastName) {
    this.lastName = lastName;
  }

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

  void setPasswordConfirmation(String passwordConfirmation) {
    if (passwordConfirmation != '') {
      if (passwordConfirmation != this.password) {
        throw CommonErrors("Password does not match");
      }
    }
    this.passwordConfirmation = passwordConfirmation;
  }

  bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool validateData() {
    return this.firstName != null &&
        this.lastName != null &&
        this.email != null &&
        this.password != null &&
        this.passwordConfirmation != null;
  }

  submitSignUp() async {
    await _authState.signUp(
      firstName: this.firstName,
      lastName: this.lastName,
      email: this.email,
      password: this.password,
      passwordConfirmation: this.passwordConfirmation,
    );
  }
}
