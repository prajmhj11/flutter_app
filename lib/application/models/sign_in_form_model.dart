class SignInFormModel {
  String email;
  String password;

  void setEmail(String email) {
    // email validation
    if (!email.contains("@")) {
      throw LoginError(message: "Invalid email");
    }
    this.email = email;
  }

  bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}

class LoginError extends Error {
  final String message;
  LoginError({this.message});
}
