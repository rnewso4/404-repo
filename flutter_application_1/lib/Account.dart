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

  String getEmail() {
    return _email;
  }

  String getPassword() {
    return _password;
  }

  void changeDescription(String description) {
    _description = description;
  }
}
