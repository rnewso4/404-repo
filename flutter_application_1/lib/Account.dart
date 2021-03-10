abstract class Account {
  String _name;
  String _description;
  String _email;
  String _password;

  Account(String name, String description, String email, String password) {
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
}
