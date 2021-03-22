import 'package:flutter_application_1/DataServices.dart';
import 'Account.dart';
import 'Group.dart';

class User extends Account {
  String _year;
  String _major;
  DataServices dataServices;
  String _id;
  int membershipNum;

  User(String email, String password, String name, String description,
      String grade, String degree)
      : super(email, password, name, description) {
    _year = grade;
    _major = degree;
  }

  User.fromData(Map<String, dynamic> data) : super.fromData(data) {
    _year = data["year"];
    _major = data["major"];
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
