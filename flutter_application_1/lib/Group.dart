import 'dart:collection';
import 'Account.dart';
import 'User.dart';

class Group extends Account {
  User _owner;
  List<User> _members;

  Group(String name, String description, String email, String password,
      User owner)
      : super(name, description, email, password) {
    _owner = owner;
  }

  //adds member to group in firebase
  addMember(User user) {
    _members.add(user);
  }

  removeMember(User user) {
    _members.remove(user);
  }

  //returns list of members from firebase
  List<User> getMembers() {
    return _members.toList();
  }

  //saves group in firebase
  saveGroup() {}
}
