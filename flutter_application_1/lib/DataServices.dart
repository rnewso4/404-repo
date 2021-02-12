import 'package:cloud_firestore/cloud_firestore.dart';

class DataServices {
  // Firestore firestore = Firestore().
  static final DataServices _dataServices = DataServices._internal();

  factory DataServices() {
    return _dataServices;
  }

  DataServices._internal();
}
