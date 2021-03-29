import 'dart:collection';
import 'Account.dart';
import 'User.dart';

/**
 * This class is used for the establishment of Groups
 * which can create events and add members (Accounts) to said groups
 * 
 * @author: 
 * commented by: Daniel Ahmed
 */

class Group extends Account {
  User _owner;
  List<User> _members;

  /**
   * Adds Owner of group to the constructor
   * 
   * routine: Group
   * 
   * return type: void
   * 
   * parameters: 
   *    name    [String]   Name of group
   *    description [String]  description of group
   *    owner   [String]   Owner of group
   * 
   * @author: 
   */
  Group(String name, String description) : super(name, description) {
    //_owner = owner;
  }

  /**
   * adds member to a group
   * 
   * routine: addMember
   * 
   * return type: Void
   * 
   * parameters:
   *    user [User]  user account
   * 
   * @author: 
   */

  addMember(User user) {
    _members.add(user);
  }

  /**
   * removes member from a group
   * 
   * routine: removeMember
   * 
   * return type: Void
   * 
   * parameters
   *    user [User]  user account
   * 
   * @author: 
   */
  removeMember(User user) {
    _members.remove(user);
  }

  /**
   * retrieves members from a specified group via firebase
   * 
   * routine: getMembers
   * 
   * return type: List
   * 
   * @author: 
   */
  List<User> getMembers() {
    return _members.toList();
  }

  /**
   * Saves new/modified group in firebase
   * 
   * routine: saveGroup
   * 
   * return type: Void
   * 
   * @author: 
   */
  saveGroup() {}
}
