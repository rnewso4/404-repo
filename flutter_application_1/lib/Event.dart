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

  static Account getOrganizer(Event _event) {
    return _event._organizer;
  }

  static List<User> getParticipants(Event _event) {
    return _event._participants;
  }

  static String getAbout(Event _event) {
    return _event._about;
  }

  static String getStart(Event _event) {
    return _event._start;
  }

  static String getEnd(Event _event) {
    return _event._end;
  }

  static String getDate(Event _event) {
    return _event._date;
  }

  static String getID(Event _event) {
    return _event._id;
  }

  static double getLat(Event _event) {
    return _event._lat;
  }

  static double getLng(Event _event) {
    return _event._lng;
  }

  static String getTitle(Event _event) {
    return _event._title;
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
      "particiants": _participants
    };
  }
}
