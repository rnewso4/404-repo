import 'Account.dart';
import 'Group.dart';

class User extends Account {
  String _year;
  String _major;
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

  //will return the groups the user has membership to
  List<Group> getMembership() {
    return new List<Group>();
  }

  //Will save user in firebase database and firebase authentication
  saveUser() {}
}
