import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapss extends StatefulWidget{
  @override
  _MapsState createState() => new _MapsState();
}

class _MapsState extends State<Mapss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(30.4133, -91.1800),
          zoom: 15
          )
        )
    );
  }
  }