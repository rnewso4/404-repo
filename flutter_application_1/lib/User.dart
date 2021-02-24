import 'Account.dart';
import 'Group.dart';

class User extends Account {
  User(String name, String description) : super(name, description) ;

  //Will add user to list of members in group as well as add group to the list of user memberships
  addMembership(Group group) {}

  //will return the groups the user has membership to
  List<Group> getMembership() {
    return new List<Group>();
  }

  //Will save user in firebase database and firebase authentication
  saveUser() {}
}
