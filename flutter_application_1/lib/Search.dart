import 'Account.dart';
import 'Event.dart';

/**
 * This class is used for searching  
 * 
 * @author: 
 * commented by: Daniel Ahmed
 */ ///

class Search {
  /**
   * creates an instance of the object that allows us to search and it makes the class a singleton
   * 
   * routine:_search
   * 
   * return type: Search
   * 
   * @author: Dylan Wichman
   */ ///

  static final Search _search = Search._internal();

  factory Search() {
    return _search;
  }

  Search._internal();

  //will query accounts from firebase based on the search term and return the results
  /**
   * This method is for the users to search accounts
   * 
   * routine: searchAccount
   * 
   * return type: List
   * 
   * parameters:
   *    term   [String]    term for account
   * 
   * @author: 
   */ ///
  List<Account> searchAccounts(String term) {
    return new List<Account>();
  }

  /**
   * This method is for the users to search accounts
   * 
   * routine: searchEvents
   * 
   * return type: List
   * 
   * parameters:
   *    term    [String]    term for event
   * 
   * @author: 
   */ ///
  List<Event> searchEvents(String term) {
    return new List<Event>();
  }
}
