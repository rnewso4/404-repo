import 'DataServices.dart';
import 'Group.dart';
import 'Account.dart';
import 'User.dart';

class Event {
  String _id;
  Account _organizer;
  String _about;
  String _start;
  String _end;
  String _date;
  String _title;
  double _lat;
  double _lng;
  List<User> _participants;

  Event.fromData(Map<String, dynamic> data, String id) {
    this._id = id;
    this._organizer = data["organizer"];
    this._about = data["about"];
    this._lat = data["lat"];
    this._lng = data["lng"];
    this._start = data["start"];
    this._end = data["end"];
    this._date = data["date"];
    //this._participants ; //need to turn users id number into user obj and then add to participants (prehaps a loop)
  }

  //Need to add Account orgranizer;
  Event(String title, String about, String start, String end, String date,
      double lat, double lng) {
    //this._organizer = organizer;
    this._title = title;
    this._about = about;
    this._lat = lat;
    this._lng = lng;
    this._start = start;
    this._end = end;
    this._date = date;
    this._id; //get next id from firebase
    //this._participants = [];
    //_participants.add(organizer);
    //createEvent();
  }

  //test event
  Event.test(
      String title, String about, String start, String end, String date) {
    this._title = title;
    this._about = about;
    this._start = start;
    this._end = end;
    this._date = date;
    this._id; //get next id from firebase
    this._participants = [];
    createEvent();
  }

  addParticipitant(User user) {
    this._participants.add(user);
  }

  removeParticipant(User user) {
    this._participants.remove(user);
  }

  Account getOrganizer() {
    return _organizer;
  }

  List<User> getParticipants() {
    return _participants;
  }

  String getAbout() {
    return _about;
  }

  String getStart() {
    return _start;
  }

  String getEnd() {
    return _end;
  }

  String getDate() {
    return _date;
  }

  String getID() {
    return _id;
  }

  double getLat() {
    return _lat;
  }

  double getLng() {
    return _lng;
  }

  String getTitle() {
    return _title;
  }

  Future<void> createEvent() {
    return DataServices().saveEvent(this).then((doc) => {this._id = doc.id});
  }

  Map<String, dynamic> getMap() {
    return {
      "organizer": _organizer,
      "about": _about,
      "lat": _lat,
      "lng": _lng,
      "start": _start,
      "end": _end,
      "date": _date,
      "title": _title,
      "participants": _participants
    };
  }
}
