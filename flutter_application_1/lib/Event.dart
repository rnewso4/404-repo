import 'Group.dart';
import 'Account.dart';
import 'User.dart';

class Event {
  Account _organizer;
  String _about;
  double _lat;
  double _lng;

  Event(Account organizer, String about, double lat, double lng) {
    this._organizer = organizer;
    this._about = about;
    this._lat = lat;
    this._lng = lng;
  }

  //adds participant to event in firebase
  addParticipitant(User user) {}

  Account getOrganizer() {}

  //returns a list of participants from firebase
  List<User> getParticipants() {
    return new List<User>();
  }

  String getAbout() {
    return _about;
  }

  //save event to firebase
  saveEvent() {}
}
