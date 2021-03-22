import 'package:cloud_firestore/cloud_firestore.dart';

import 'Event.dart';
import 'User.dart';

class DataServices {
  static final DataServices _dataServices = DataServices._internal();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  factory DataServices() {
    return _dataServices;
  }

  DataServices._internal();

  // returns data from firebase at specified document path
  Future<Map<String, dynamic>> _getDataAtPath(DocumentReference path) {
    return path.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        return documentSnapshot.data();
      } else {
        print('Document does not exist on the database');
        return Map<String, dynamic>();
      }
    });
  }

  //Adds data in firebase at specified collection path
  Future<DocumentReference> _addDataAtPath(
      CollectionReference path, Map<String, dynamic> data) {
    return path.add(data).then((value) {
      return value;
    });
  }

  //updates data in firebase at specified document path
  Future<void> _updateDataAtPath(
      DocumentReference path, Map<String, dynamic> data) {
    return path
        .update(data)
        .then((value) => print("Data successfully updated"))
        .catchError((error) => print("Failed to update data: $error"));
  }

  //deletes data in firebase at specified document path
  Future<void> _deleteDataAtPath(DocumentReference path) {
    return path
        .delete()
        .then((value) => print("Data successfully deleted"))
        .catchError((error) => print("Failed to delete data: $error"));
  }

  Future<DocumentReference> saveUser(User user) {
    CollectionReference path = firestore.collection("users");
    return _addDataAtPath(path, user.getMap());
  }

  Future<DocumentReference> saveEvent(Event event) {
    CollectionReference path = firestore.collection("events");
    return _addDataAtPath(path, event.getMap());
  }

  Future<List<Event>> getCurrentEvents() {
    CollectionReference path = firestore.collection("events");
    List<Event> events;
    return path.get().then((snap) {
      snap.docs.forEach((element) {
        Event event = new Event.fromData(element.data(), element.id);
        events.add(event);
      });

      return events;
    });
  }
}
