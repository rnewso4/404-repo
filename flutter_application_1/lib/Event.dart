import 'DataServices.dart';
import 'Group.dart';
import 'Account.dart';
import 'User.dart';

class Event {
  String _id;
  Account _organizer;
  String _about;
  double _lat;
  double _lng;
  List<User> _participants;

  Event.fromData(Map<String, dynamic> data) {
    //this._id = data. ;
    //this._organizer = data. ;
    //this._about = data. ;
    //this._lat = data. ;
    //this._lng = data. ;
    //this._participants ; //need to turn users id number into user obj and then add to participants (prehaps a loop)
  }

  Event(Account organizer, String about, double lat, double lng) {
    this._organizer = organizer;
    this._about = about;
    this._lat = lat;
    this._lng = lng;
    this._id; //get next id from firebase
    this._participants = [];
    //if the organizor is a user add them to participants else (organizor is a group) do nothing
    createEvent();
  }

  addParticipitant(User user) {
    this._participants.add(user);
  }

  removeParticipant(User user) {
    this._participants.remove(user);
  }

  Account getOrganizer() {
    return this._organizer;
  }

  List<User> getParticipants() {
    return this._participants;
  }

  String getAbout() {
    return this._about;
  }

  double getLat() {
    return this._lat;
  }

  String getID() {
    return this._id;
  }

  double getLng() {
    return this._lng;
  }

  Future<void> createEvent() {
    return DataServices().saveEvent(this).then((doc) => {this._id = doc.id});
  }

  Map<String, dynamic> getMap() {
    return {"organizer": _organizer, "about": _about, "lat": _lat, "lng": _lng};
  }
}
