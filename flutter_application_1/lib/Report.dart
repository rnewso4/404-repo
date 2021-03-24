import 'User.dart';

/**
 * Specifies types of possible reports, organized from most important to least
 * @author George Adler Buras
 */
enum Category {
  criminalActivity,
  suspiciousActivity,
  badFaithActivity,
  fakeActivity,
  other
}

class Report {
  String _title;
  String _issue;
  User _reporter;

  //Specific catagory of report, used to sort by in Firebase
  var _category;

  Report(String title, String issue, var category) {
    this._title = title;
    this._issue = issue;
    //this._reporter = new User();
    this._category = category;
  }

  String getTitle() {
    return _title;
  }

  String getIssue() {
    return _issue;
  }

  String getCategory() {
    return _category;
  }

  //saves report in firebase
  saveReport() {}
}
