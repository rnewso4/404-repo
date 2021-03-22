abstract class Account {
  String _name;
  String _description;

  Account(String name, String description) {
    _name = name;
    _description = description;
  }

  Account.fromData(Map<String, dynamic> data) {
    _name = data["name"];
    _description = data["description"];
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
