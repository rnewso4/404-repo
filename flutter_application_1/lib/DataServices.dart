import 'package:cloud_firestore/cloud_firestore.dart';

class DataServices {
  static final DataServices _dataServices = DataServices._internal();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  factory DataServices() {
    return _dataServices;
  }

  DataServices._internal();

  // these functions will be asyncronous once we get firebase implemented

  // returns data from firebase at specified document path
  Future<Map<String, dynamic>> getDataAtPath(DocumentReference path) {
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
  Future<void> addDataAtPath(
      CollectionReference path, Map<String, dynamic> data) {
    return path
        .add(data)
        .then((value) => print("Data successfully added"))
        .catchError((error) => print("Failed to add data: $error"));
  }

  //updates data in firebase at specified document path
  Future<void> updateDataAtPath(
      DocumentReference path, Map<String, dynamic> data) {
    return path
        .update(data)
        .then((value) => print("Data successfully updated"))
        .catchError((error) => print("Failed to update data: $error"));
  }

  //deletes data in firebase at specified document path
  Future<void> deleteDataAtPath(DocumentReference path) {
    return path
        .delete()
        .then((value) => print("Data successfully deleted"))
        .catchError((error) => print("Failed to delete data: $error"));
  }
}
