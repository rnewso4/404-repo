abstract class Account {
  String _name;
  String _description;
  String _email;
  String _password;

  Account(String email, String password, String name, String description) {
    _name = name;
    _description = description;
    _email = email;
    _password = password;
  }

  String getName() {
    return _name;
  }

  void changeName(String name) {
    _name = name;
  }

  String getDescription() {
    return _description;
  }

  void changeDescription(String description) {
    _description = description;
  }

  String getEmail() {
    return _email;
  }

  void changeEmail(String email) {
    _email = email;
  }

  String getPassword() {
    return _password;
  }

  void changePassword(String password) {
    _password = password;
  }
}
