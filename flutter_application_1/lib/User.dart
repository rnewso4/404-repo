import 'Account.dart';
import 'Group.dart';

class User implements Account {
  String _name;
  String _description;

  User(String name, String description) {}

  @override
  String getDescription() {
    return _description;
  }

  @override
  String getName() {
    return _name;
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
