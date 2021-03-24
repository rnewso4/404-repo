import 'dart:collection';
import 'Account.dart';
import 'User.dart';

class Group extends Account {
  User _owner;
  List<User> _members;

  //Add Owner to constructor
  Group(String name, String description) : super(name, description) {
    //_owner = owner;
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
