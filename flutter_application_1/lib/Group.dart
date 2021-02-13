import 'Account.dart';
import 'User.dart';

class Group implements Account {
  String _name;
  String _description;
  User _owner;

  Group(String name, String description) {
    this._name = name;
    this._description = description;
    this._owner = new User("default", "defualt");
  }

  @override
  String getDescription() {
    return _description;
  }

  @override
  String getName() {
    return _name;
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
