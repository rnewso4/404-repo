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

/**
 * This class is used to represent reports
 * 
 * @author
 * commented by: George Adler Buras
 */
class Report {
  //The title of the report
  String _title;

  //The description of the issue the report is about
  String _issue;

  //The user who created the report
  User _reporter;

  //Specific catagory of report, used to sort by in Firebase
  var _category;

  /**
   * Constructor used to create a report object
   * 
   * routine: Report
   * 
   * return type: Report
   * 
   * parameteres:
   *    title     [String]    the title of the report
   *    issue     [String]    the description of the issue the report is about
   *    category  [var]       the category of the report
   * 
   * @author
   */
  Report(String title, String issue, var category) {
    this._title = title;
    this._issue = issue;
    //this._reporter = new User();
    this._category = category;
  }

  /**
   * This method gets the title of the report
   * 
   * routine: getTitle
   * 
   * return type: String
   * 
   * @author
   */
  String getTitle() {
    return _title;
  }

  /**
   * This method gets the description of the issue the report is about
   * 
   * routine: getIssue
   * 
   * return type: String
   * 
   * @author
   */
  String getIssue() {
    return _issue;
  }

  /**
   * This method gets the category of the issue;
   * transforming it into a String in the process
   * 
   * routine: getCategory
   * 
   * return type: String
   * 
   * @author George Adler Buras
   */
  String getCategory() {
    if (_category == Category.criminalActivity) {
      return "Criminal Activity";
    } else if (_category == Category.suspiciousActivity) {
      return "Suspicious Activity";
    } else if (_category == Category.badFaithActivity) {
      return "Bad Faith Activity";
    } else if (_category == Category.fakeActivity) {
      return "Fake Activity";
    } else if (_category == Category.other) {
      return "Other";
    } else {
      return "ERROR: ENUMERATION FAILURE";
    }
  }

  //saves report in firebase
  saveReport() {}
}
