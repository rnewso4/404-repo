import 'Account.dart';
import 'Event.dart';

class Search {
  static final Search _search = Search._internal();

  factory Search() {
    return _search;
  }

  Search._internal();

  //will query accounts from firebase based on the search term and return the results
  List<Account> searchAccounts(String term) {
    return new List<Account>();
  }

  List<Event> searchEvents(String term) {
    return new List<Event>();
  }
}
