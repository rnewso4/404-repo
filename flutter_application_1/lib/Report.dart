import 'User.dart';

class Report {
  String _title;
  String _issue;
  User _reporter;

  Report(String title, String issue) {
    this._title = title;
    this._issue = issue;
    this._reporter = new User("default", "default");
  }

  String getTitle() {
    return _title;
  }

  String getIssue() {
    return _issue;
  }

  //saves report in firebase
  saveReport() {}
}
