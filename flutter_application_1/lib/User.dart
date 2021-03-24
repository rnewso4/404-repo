import 'package:flutter_application_1/DataServices.dart';
import 'Account.dart';
import 'Group.dart';

class User extends Account {
  String _year;
  String _major;
  DataServices dataServices;
  String _id;
  int membershipNum;
  String _email;
  String _password;

  User(String email, String password, String name, String description,
      String grade, String degree)
      : super(name, description) {
    _year = grade;
    _major = degree;
    _email = email;
    _password = password;
  }

  User.fromData(Map<String, dynamic> data) : super.fromData(data) {
    _year = data["year"];
    _major = data["major"];
    _email = data["email"];
    _password = data["password"];
  }

  String getYear() {
    return _year;
  }

  changeYear(String grade) {
    _year = grade;
  }

  String getMajor() {
    return _major;
  }

  changeMajor(String degree) {
    _major = degree;
  }

  //Will add user to list of members in group as well as add group to the list of user memberships
  addMembership(Group group) {
    membershipNum++;
  }

  //will return the groups the user has membership to
  List<Group> getMembership() {
    //return new List<Group>();
  }

  void setId(String id) {
    _id = id;
  }

  String getId() {
    return _id;
  }

  String getEmail() {
    return _email;
  }

  void changeEmail(String email) {
    _email = email;
  }

  String getPassword() {
    return _password;
  }

  void changePassword(String password) {
    _password = password;
  }

  //Will save user in firebase database and firebase authentication
  Future<void> createUser() {
    return DataServices().saveUser(this);
  }

  Map<String, dynamic> getMap() {
    return {
      "name": super.getName(),
      "description": super.getDescription(),
      "year": _year,
      "major": _major,
      "uid": _id
    };
  }
}
/**
   * Email associated with the account, used for login and selling to the highest bidder;
   * private, as indicated by the underscore in front
   * 
   * @author
   * commented by: George Adler Buras
   */

/**
   * Password associated with the account, used for login;
   * private, as indicated by the underscore in front
   * 
   * @author
   * commented by: George Adler Buras
   */

/**
   * This method gets the email associated with the account
   * 
   * routine: getEmail
   * 
   * return type: String
   * 
   * @author
   * commented by: George Adler Buras
   */

/**
   * This method changes the email associated with the graph
   * 
   * routine: changeEmail
   * 
   * return type: void
   * 
   * parameters: 
   *    email   [String]    the new email to be associated with the account
   * 
   * @author
   * commented by: George Adler Buras
   */

/**
   * This method gets the password associated with the account
   * 
   * routine: getPassword
   * 
   * return type: String
   * 
   * @author
   * commented by: George Adler Buras
   */

/**
   * This method changes the password associated with the account to a new one
   * 
   * routine: changePassword
   * 
   * return type: void
   * 
   * parameters:
   *    password    [String]    The new password to be associated with the account
   * 
   * @author
   * commented by: George Adler Buras
   */
