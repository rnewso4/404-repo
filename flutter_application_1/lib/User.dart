import 'package:flutter_application_1/DataServices.dart';
import 'Account.dart';
import 'Group.dart';

class User extends Account {
  String _year;
  String _major;
<<<<<<< HEAD
  String id;
  DataServices dataServices;
=======
  String _id;
>>>>>>> fb31cb6b2f5f2b4597f5107e44237ae0336e067c
  User(String name, String description, String email, String password,
      String grade, String degree)
      : super(name, description, email, password) {
    _year = grade;
    _major = degree;
  }

  getYear() {
    return _year;
  }

  changeYear(String grade) {
    _year = grade;
  }

  getMajor() {
    return _major;
  }

  changeMajor(String degree) {
    _major = degree;
  }

  //Will add user to list of members in group as well as add group to the list of user memberships
  addMembership(Group group) {}

  savaUser() {}

  //will return the groups the user has membership to
  List<Group> getMembership() {
    return new List<Group>();
  }

  //Will save user in firebase database and firebase authentication
  Future<void> createUser() {
    return DataServices().saveUser(this).then((doc) => {this._id = doc.id});
  }

  Map<String, dynamic> getMap() {
    return {
      "name": super.getName(),
      "description": super.getDescription(),
      "year": _year,
      "major": _major
    };
  }
}
