import 'Account.dart';
import 'User.dart';

class Group extends Account {
  User _owner;

  Group(String name, String description) : super(name, description) {
    this._owner = new User("default", "defualt");
  }

  //adds member to group in firebase
  addMember(User user) {}

  //returns list of members from firebase
  List<User> getMembers() {
    return new List<User>();
  }

  //saves group in firebase
  saveGroup() {}
}
