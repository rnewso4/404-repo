import 'package:cloud_firestore/cloud_firestore.dart';

class DataServices {
  static final DataServices _dataServices = DataServices._internal();

  factory DataServices() {
    return _dataServices;
  }

  DataServices._internal();

  // these functions will be asyncronous once we get firebase implemented

  // returns data from firebase at specified path
  Map<String, dynamic> getDataAtPath(String path) {
    return new Map<String, dynamic>();
  }

  //updates data in firebase at specified path
  updateDataAtPath(String path, Map<String, dynamic> data) {}

  //deletes data in firebase at specified path
  deleteDataAtPath(String path, Map<String, dynamic> data) {}
}
