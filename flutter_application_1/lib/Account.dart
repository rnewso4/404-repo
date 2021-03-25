/** 
 * This class is used to represent accounts, which is extended by both the User class
 * and the Group class.
 * 
 * @author
 * commented by: George Adler Buras
 */
abstract class Account {
  //Name associated with the account (User name or Group name)
  String _name;

  //Description of the account: Any additional information a user or group wants to include to make them unique
  String _description;

  /**
   * Constructor used to create an account object, not specificly a user or group account
   * 
   * routine: Account
   * 
   * return type: Account
   * 
   * parameters:
   *    name          [String]  the name associated with the account
   *    description   [String]  a description of the account
   * 
   * @author 
   */
  Account(String name, String description) {
    _name = name;
    _description = description;
  }

  /**
   * This constructor takes in the Firebase data to create an Account object
   * 
   * routine: Account.fromData
   * 
   * return type: Account
   * 
   * parameters:
   *    data  [Map]   The raw account data from Firebase
   * 
   * @author Dylan Wichman
   */
  Account.fromData(Map<String, dynamic> data) {
    _name = data["name"];
    _description = data["description"];
  }

  /**
   * This method gets the name associated with the account
   * 
   * routine: getName
   * 
   * return type: String
   * 
   * @author
   */
  String getName() {
    return _name;
  }

  /**
   * This method changes the name associated with the account to a new one
   * 
   * routine: changeName
   * 
   * return type: void
   * 
   * parameters:
   *    name  [String]  the new name that will be associated with the account
   * 
   * @author
   */
  void changeName(String name) {
    _name = name;
  }

  /**
   * This method gets the description of the account
   * 
   * routine: getDescription
   * 
   * return type: String
   * 
   * @author
   */
  String getDescription() {
    return _description;
  }

  /**
   * This method changes the description of the account to a new one
   * 
   * routine: changeDescription
   * 
   * return type: void
   * 
   * parameters:
   *    description   [String]    the new description of the account
   * 
   * @author
   */
  void changeDescription(String description) {
    _description = description;
  }
}
