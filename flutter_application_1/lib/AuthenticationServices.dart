import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'User.dart';

class AuthenticationServices {
  fb.FirebaseAuth auth = fb.FirebaseAuth.instance;

  static final AuthenticationServices _authenticationServices =
      AuthenticationServices._internal();

  factory AuthenticationServices() {
    return _authenticationServices;
  }

  AuthenticationServices._internal();

  // these functions will be asyncronous once we get firebase implemented
  createAccount(User account) {}

  //login user in firebase
  loginAccount(String email, String password) {}
}
