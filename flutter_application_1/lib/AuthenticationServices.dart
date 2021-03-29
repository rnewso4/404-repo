import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/DataServices.dart';

import 'User.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

/**
 * This class is used for Authentication Services 
 * that verify and identify user logins/passwords
 * 
 * @author
 * commented by: Daniel Ahmed
 */ ///

class AuthenticationServices {
  //
  static final AuthenticationServices _authenticationServices =
      AuthenticationServices._internal();

  /**
   * creates an instance of the object that allows us to use the firebase authentication framework
   * 
   * routine: authentication
   * 
   * return type: authentication
   * 
   * @author: Dylan Wichman
   */ ///

  auth.FirebaseAuth authentication = auth.FirebaseAuth.instance;

  factory AuthenticationServices() {
    return _authenticationServices;
  }

  AuthenticationServices._internal();

  // these functions will be asyncronous once we get firebase implemented
  /**
   * This method is for the establishment of creating an account and storing it
   * 
   * routine: createAccount
   * 
   * return type: String
   * 
   * parameters
   *    account [User]   user details passed in to create account
   * @author: Dylan Wichman
   */ ///

  Future<dynamic> createAccount(User account) async {
    try {
      auth.UserCredential userCredential =
          await authentication.createUserWithEmailAndPassword(
              email: account.getEmail(), password: account.getPassword());
      account.setId(userCredential.user.uid);
      return account.createUser();
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
  /**
     * This method is for login via app startup
     * 
     * if user doesnt have account created/types in info incorrectly
     *  they get user-not=found
     * 
     * if user enters correct username/has an account 
     * but enters wrong pw they will get "wrong password provided for that user"
     * 
     * routine: loginAccount
     * 
     * return type: String
     * 
     * parameters:
     *    email   [String]    email used for logging in
     *    password   [String]   password used for logging in
     * 
     * @author: Dylan Wichman
     */ ///

  Future<dynamic> loginAccount(String email, String password) async {
    try {
      auth.UserCredential userCredential = await auth.FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        return value;
      });
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }

  /**
   * This method is for retrieving the current user
   * 
   * routine: getCurrentUser
   * 
   * return type: null
   * 
   * @author: Dylan Wichman
   */ ///

  Future<User> getCurrentUser() {
    if (authentication.currentUser != null) {
      String uid = authentication.currentUser.uid;
      return DataServices().getUser(uid);
    } else {
      return null;
    }
  }
}
