import 'package:flutter_application_1/DataServices.dart';

import 'Account.dart';
import 'Group.dart';

class User extends Account {
  String year;
  String major;
  DataServices dataServices;
  User(String name, String description, String grade, String degree)
      : super(name, description) {
    year = grade;
    major = degree;
  }

  getYear() {
    return year;
  }

  changeYear(String grade) {
    year = grade;
  }

  getMajor() {
    return major;
  }

  changeMajor(String degree) {
    major = degree;
  }

  //Will add user to list of members in group as well as add group to the list of user memberships
  addMembership(Group group) {}

  //will return the groups the user has membership to
  List<Group> getMembership() {
    return new List<Group>();
  }

  //Will save user in firebase database and firebase authentication
  Future<void> saveUser() {
    return DataServices().saveUser(this);
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
