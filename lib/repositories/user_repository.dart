import 'package:flutter_app/application/classes/auth/user.dart';

abstract class UserRepository {
  // Fetch User information
  Future<User> getUser();
}
