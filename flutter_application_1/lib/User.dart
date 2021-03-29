import 'package:flutter_application_1/DataServices.dart';
import 'Account.dart';
import 'Group.dart';

/**
 * Specifies the possible years that one can be in school
 * _year needs to be changed to a var to implement this, need to check that won't
 * break anything
 * 
 * @author George Adler Buras
 */
enum SchoolYear { freshman, sophomore, junior, senior, graduate, other }

/**
 * This class is used to represent users; it extends accounts
 * 
 * @author Kyle McCraine
 * commented by George Adler Buras
 */
class User extends Account {
  //The year of the user in college.
  String _year;

  //The major of the user in college.
  String _major;

  DataServices dataServices;

  //Unique user id
  String _id;

  int membershipNum;

  //Email associated with the account; used for login and selling to the highest bidder
  String _email;

  //Password associated with the account, used for login;
  String _password;

  /**
   * Constructor used to create a user object
   * 
   * routine: User
   * 
   * return type: User
   * 
   * parameters:
   *    email         [String]    the email associated with the user account
   *    password      [String]    the password associated with the user account
   *    name          [String]    the name associated with the user account
   *    description   [String]    a desciption of the user account
   *    grade         [String]    the year of the user in college
   *    degree        [String]    the major of the user in college
   * 
   * @author Kyle McCraine
   */
  User(String email, String password, String name, String description,
      String grade, String degree)
      : super(name, description) {
    _year = grade;
    _major = degree;
    _email = email;
    _password = password;
  }

  /**
   * This constructor takes in the Firebase data to create a User object
   * 
   * routine: User.fromData
   * 
   * return type: User
   * 
   * parameters:
   *    data  [Map<String, dynamic>]   the raw user account data from Firebase
   * 
   * @author Dylan Wichman
   */
  User.fromData(Map<String, dynamic> data) : super.fromData(data) {
    _year = data["year"];
    _major = data["major"];
    _email = data["email"];
    _password = data["password"];
  }

  /**
   * This method gets the year in college of the user
   * 
   * routine: getYear
   * 
   * return type: String
   * 
   * @author Kyle McCraine
   */
  String getYear() {
    return _year;
  }

  /**
   * This method changes the year in college of the user
   * 
   * routine: changeYear
   * 
   * return type: void
   * 
   * parameters:
   *    grade   [String]    the new year in college of the user
   * 
   * @author Kyle McCraine
   */
  void changeYear(String grade) {
    _year = grade;
  }

  /**
   * This method gets the major of the user in college
   * 
   * routine: getMajor
   * 
   * return type: String
   * 
   * @author Kyle McCraine
   */
  String getMajor() {
    return _major;
  }

  /**
   * This method changes the major of the user in college
   * 
   * routine: changeMajor
   * 
   * return type: void
   * 
   * parameters:
   *    degree    [String]    the new major of the user in college
   * 
   * @author Kyle McCraine
   */
  void changeMajor(String degree) {
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

  /**
   * This method gets the email associated with the account
   * 
   * routine: getEmail
   * 
   * return type: String
   * 
   * @author Kyle McCraine
   */
  String getEmail() {
    return _email;
  }

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
   * @author Kyle McCraine
   */
  void changeEmail(String email) {
    _email = email;
  }

  /**
   * This method gets the password associated with the account
   * 
   * routine: getPassword
   * 
   * return type: String
   * 
   * @author Kyle McCraine
   */
  String getPassword() {
    return _password;
  }

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
   * @author Kyle McCraine
   * 
   */
  void changePassword(String password) {
    _password = password;
  }

  /**
   * This method saves the user in Firebase database and Firebase authentication
   * 
   * routine: createUser
   * 
   * return type: Future<void>
   * 
   * @author Dylan Wichman
   */
  Future<void> createUser() {
    return DataServices().saveUser(this);
  }

  /**
   * This method gets the map of raw user data from Firebase
   * 
   * routine: getMap
   * 
   * return type: Map<String, dynamic>
   * 
   * @author Dylan Wichman
   */
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
