import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'Event.dart';
import 'User.dart';

/**
 * Data Services used to collect and store data
 * 
 * @author
 * commented by: Daniel Ahmed
 */ ///

class DataServices {
  static final DataServices _dataServices = DataServices._internal();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  factory DataServices() {
    return _dataServices;
  }

  DataServices._internal();

  /**
   * returns data from firebase at specified document path
   * 
   * routine: _getDataAtPath
   * 
   * return type: Map<String, dynamic>
   * 
   * parameters:
   *    path    [DocumentReference]   path to document
   * 
   * @author: Dylan Wichman
   */ ///
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

  /**
     * Adds data in firebase at specified collection path
     * 
     * routine: _getDataAtPath
     * 
     * return type: DocumentReference
     * 
     * @author: Dylan Wichman
     */ ///
  Future<DocumentReference> _addDataAtPath(
      CollectionReference path, Map<String, dynamic> data) {
    return path.add(data).then((value) {
      return value;
    });
  }

  /**
     * Adds data in firebase at specified doc path
     * 
     * routine: _addDataAtPath
     * 
     * return type: void
     * 
     * parameters:
     *    path    [DocumentReference]  path to doc
     *    data    [Map<String, dynamic>] data from doc
     * 
     * @author: Dylan Wichman
     */ ///
  Future<Void> _addDataAtDocPath(
      DocumentReference path, Map<String, dynamic> data) {
    return path.update(data);
  }

  /**
     * updates data in firebase at specified document path
     * 
     * routine: _getDataAtPath
     * 
     * return type: void
     * 
     * parameters:
     *    path    [DocumentReference]  path to doc
     *    data    [Map<String, dynamic>]  data from doc
     * 
     * @author: Dylan Wichman
     */ ///
  Future<void> _updateDataAtPath(
      DocumentReference path, Map<String, dynamic> data) {
    return path
        .update(data)
        .then((value) => print("Data successfully updated"))
        .catchError((error) => print("Failed to update data: $error"));
  }

  /**
     * deletes data in firebase at specified document path
     * 
     * routine: _deleteDataAtPath
     * 
     * return type: void
     * 
     * parameters:
     *    path    [DocumentReference]  path to doc
     * 
     * @author: Dylan Wichman
     */ ///
  Future<void> _deleteDataAtPath(DocumentReference path) {
    return path
        .delete()
        .then((value) => print("Data successfully deleted"))
        .catchError((error) => print("Failed to delete data: $error"));
  }

  /**
     * saves user in the data for that doc
     * 
     * routine: _saveUser
     * 
     * return type: void
     * 
     * parameters:
     *    user    [User]  path to doc
     * 
     * @author: Dylan Wichman
     */ ///
  Future<void> saveUser(User user) {
    DocumentReference path = firestore.collection("users").doc(user.getId());
    return _addDataAtDocPath(path, user.getMap());
  }

  /**
     * saves user in the data for that doc
     * 
     * routine: _saveUser
     * 
     * return type: DocumentReference
     * 
     * parameters:
     *    event    [Event]  event used in reference for save
     * 
     * @author: Dylan Wichman
     */ ///
  Future<DocumentReference> saveEvent(Event event) {
    CollectionReference path = firestore.collection("events");
    return _addDataAtPath(path, event.getMap());
  }

  /**
     * saves user in the data for that doc
     * 
     * routine: _saveUser
     * 
     * return type: List<Event>
     * 
     * @author: Dylan Wichman
     */ ///
  Future<List<Event>> getCurrentEvents() {
    CollectionReference path = firestore.collection("events");
    List<Event> events = [];
    return path.get().then((snap) {
      snap.docs.forEach((element) {
        Event event = new Event.fromData(element.data(), element.id);
        events.add(event);
      });
      events.remove(null);
      return events;
    });
  }

  /**
     * gets user for referenced doc
     * 
     * routine: _getUser
     * 
     * return type: User
     * 
     * parameters:
     *    id    [String] id used to find doc
     * 
     * @author: Dylan Wichman
     */ ///
  Future<User> getUser(String id) {
    DocumentReference path = firestore.collection("users").doc(id);
    return _getDataAtPath(path).then((data) {
      return User.fromData(data);
    });
  }
}
