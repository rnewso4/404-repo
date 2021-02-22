abstract class Account {
  String _name;
  String _description;

  Account(String name, String description) {
    _name = name;
    _description = description;
  }

  String getName();
  String getDescription();
}
