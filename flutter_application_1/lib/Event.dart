import 'DataServices.dart';
import 'Group.dart';
import 'Account.dart';
import 'User.dart';

/**
 * This class is used to represent events
 * 
 * @author: Daniel W
 * commented by: George Adler Buras
 */ ///
class Event {
  //The unique ID assocated with the event
  String _id;

  //The account responsible for creating the event
  Account _organizer;

  //A description of the event
  String _about;

  //The start time of the event
  String _start;

  //The end time of the event
  String _end;

  //The date of the event
  String _date;

  //The title of the event
  String _title;

  //The latitude of the location of the event
  double _lat;

  //The longitude of the location of the event
  double _lng;

  //A list of users who are participating in the event
  List<User> _participants;

  /**
   * Constructor used to create an event object
   * 
   * routine: Event
   * 
   * return type: Event
   * 
   * parameters:
   *    title   [String]    the title of the event
   *    about   [String]    a description of the event
   *    start   [String]    the start time of the event
   *    end     [String]    the end time of the event
   *    date    [String]    the date of the event
   *    lat     [double]    the latitude of the event location
   *    lng     [double]    the longitude of the event location
   * 
   * @author: Daniel W
   */ ///
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
    this._id = "ID"; //get next id from firebase
    //this._participants = [];
    //_participants.add(organizer);
    createEvent();
  }

  /**
   * This constructor takes in the Firebase data to create a User object
   * 
   * routine: Event.fromData
   * 
   * return type: Event
   * 
   * parameters
   *    data    [Map<String, dynamic>]       the raw event data from Firebase
   *    id      [String]    the unique id associated with the event
   * 
   * @author: Daniel W, Dylan W
   */ ///
  Event.fromData(Map<String, dynamic> data, String id) {
    this._title = data["title"];
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

  /**
   * This method adds a user to the list of participants who are attending an event
   * 
   * routine: addParticipitant
   * 
   * return type: void
   * 
   * parameters:
   *    user    [User]    the user who is attending the event
   * 
   * @author: Daniel W
   */ ///
  void addParticipitant(User user) {
    this._participants.add(user);
  }

  /**
   * This mehtod removes a user from the list of participants who are attending an event
   * 
   * routine: removeParticipant
   * 
   * return type: void
   * 
   * parameters:
   *    user    [User]    the user who is no longer attending the event
   * 
   * @author: Daniel W
   */ ///
  void removeParticipant(User user) {
    this._participants.remove(user);
  }

  /**
   * This method gets the creator of the event
   * 
   * routine: getOrganizer
   * 
   * return type: Account
   * 
   * @author: Daniel W
   */ ///
  Account getOrganizer() {
    return _organizer;
  }

  /**
   * This method gets the list of users attending the event
   * 
   * routine: getParticipants
   * 
   * return type: List<User>
   * 
   * @author: Daniel W
   */ ///
  List<User> getParticipants() {
    return _participants;
  }

  /**
   * This method gets the description of the event
   * 
   * routine: getAbout
   * 
   * return type: String
   * 
   * @author: Daniel W
   */ ///
  String getAbout() {
    return _about;
  }

  /**
   * This method gets the start time of the event
   * 
   * routine: getStart
   * 
   * return type: String
   * 
   * @author: Daniel W
   */ ///
  String getStart() {
    return _start;
  }

  /**
   * This mehtod gets the end time of the event
   * 
   * routine: getEnd
   * 
   * return type: String
   * 
   * @author: Daniel W
   */ ///
  String getEnd() {
    return _end;
  }

  /**
   * This method gets the date of the event
   * 
   * routine: getDate
   * 
   * return type: String
   * 
   * @author: Daniel W
   */ ///
  String getDate() {
    return _date;
  }

  /**
   * This method gets the unique ID of the event
   * 
   * routine: getID
   * 
   * return type: String
   * 
   * @author: Daniel W
   */ ///
  String getID() {
    return _id;
  }

  /**
   * This method gets the latitude of the event location
   * 
   * routine: getLat
   * 
   * return type: double
   * 
   * @author: Daniel W
   */ ///
  double getLat() {
    return _lat;
  }

  /**
   * This method gets the longitude of the event location
   * 
   * routine: getLng
   * 
   * return type: double
   * 
   * @author: Daniel W
   */ ///
  double getLng() {
    return _lng;
  }

  /**
   * This method gets the title of the event
   * 
   * routine: getTitle
   * 
   * return type: String
   * 
   * @author: Daniel W
   */ ///
  String getTitle() {
    return _title;
  }

  /**
   * This method saves the event in Firebase database and Firebase authentication
   * 
   * routine: createEvent
   * 
   * return type: Future<void>
   * 
   * @author: Dylan W
   */ ///
  Future<void> createEvent() {
    return DataServices().saveEvent(this).then((doc) => {this._id = doc.id});
  }

  /**
   * This method gets the map of raw event data from Firebase
   * 
   * routine: getMap
   * 
   * return type: Map<String, dynamic>
   * 
   * @author: Dylan W
   */ ///
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
