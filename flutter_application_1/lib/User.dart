import 'package:flutter_application_1/DataServices.dart';

import 'Account.dart';
import 'Group.dart';

class User extends Account {
<<<<<<< HEAD
  String _year;
  String _major;
  User(String name, String description, String email, String password,
      String grade, String degree)
      : super(name, description, email, password) {
    _year = grade;
    _major = degree;
=======
  String year;
  String major;
  String id;
  DataServices dataServices;
  User(String name, String description, String grade, String degree)
      : super(name, description) {
    year = grade;
    major = degree;
>>>>>>> f876ced729d97597149d323502832a163d3e2d3c
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

  //will return the groups the user has membership to
  List<Group> getMembership() {
    return new List<Group>();
  }

  //Will save user in firebase database and firebase authentication
  Future<void> createUser() {
    return DataServices().saveUser(this).then((doc) => {this.id = doc.id});
  }

  Map<String, dynamic> getMap() {
    return {
      "name": super.getName(),
      "description": super.getDescription(),
      "year": year,
      "major": major
    };
  }
}
