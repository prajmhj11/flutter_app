import 'package:flutter_app/state/auth_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class LogoutFormModel {
  final AuthState _authState = Injector.get<AuthState>();

  submitLogout() async {
    await _authState.logOut();
  }
}
