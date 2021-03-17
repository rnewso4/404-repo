import 'package:firebase_core/firebase_core.dart';

import 'User.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthenticationServices {
  static final AuthenticationServices _authenticationServices =
      AuthenticationServices._internal();

  auth.FirebaseAuth authentication = auth.FirebaseAuth.instance;

  factory AuthenticationServices() {
    return _authenticationServices;
  }

  AuthenticationServices._internal();

  // these functions will be asyncronous once we get firebase implemented
  Future<dynamic> createAccount(User account) async {
    try {
      auth.UserCredential userCredential =
          await authentication.createUserWithEmailAndPassword(
              email: account.getEmail(), password: account.getPassword());
      return userCredential;
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The account already exists for that email.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      return e.toString();
    }
  }

  //login user in firebase
  loginAccount(String email, String password) {}
}
