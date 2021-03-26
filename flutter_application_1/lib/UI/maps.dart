import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/DataServices.dart';
import 'package:flutter_application_1/UI/SingleEvent.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_application_1/services/locator.dart';
import 'package:flutter_application_1/services/navigation_service.dart';
import 'package:flutter_application_1/services/route_paths.dart' as routes;
import 'package:flutter_application_1/UI/newevent.dart';
import './size_config.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/Event.dart';

final NavigationService _navigationService = locator<NavigationService>();
bool _newEv = false;

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => new _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  List<Marker> myMarker = [];
  List<Event> eventList = [];
  List<Marker> evMarkers = [];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Timer.run(() async {
      List<Event> loadingList = List<Event>.empty(growable: true);
      loadingList = await DataServices().getCurrentEvents();
      setState(() {
        eventList = loadingList;
        loadMarkers(eventList, evMarkers);
      });
    });
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(30.4126, -91.1771), zoom: 16),
            markers: Set.from(_markersToDisplay(myMarker, evMarkers)),
            onTap: _handleMapTap,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 9,
            child: GestureDetector(
                onTap: () {
                  _navigationService.navigateTo(routes.SearchRoute);
                },
                behavior: HitTestBehavior.translucent,
                child: Container(
                  height: SizeConfig.blockSizeVertical * 9,
                  margin: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 14,
                      right: SizeConfig.blockSizeHorizontal * 8,
                      top: SizeConfig.blockSizeVertical * 5.3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(360)),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2.3,
                            top: SizeConfig.blockSizeVertical * 1.5),
                        child: Text(
                          'Q',
                          style: TextStyle(
                              fontFamily: 'bts',
                              color: Color(0xff853DD9),
                              fontSize: SizeConfig.blockSizeHorizontal * 2.7),
                        ),
                      ),
                      Text(
                        '   Search here',
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 3.5),
                      )
                    ],
                  ),
                )),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: SizeConfig.blockSizeVertical * 50,
              padding: EdgeInsets.only(
                  right: SizeConfig.blockSizeHorizontal * 2.3,
                  bottom: SizeConfig.blockSizeVertical * 12),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  child: Icon(Icons.add,
                      size: SizeConfig.blockSizeHorizontal * 12),
                  elevation: 2.5,
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xff853DD9),
                  onPressed: () {
                    _newEvTrue();
                    _navigationService.navigateTo(routes.NewEventRoute);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // change the marker for if a new event is being made
  void _newEvTrue() {
    _newEv = true;
  }

  // what to do when the map is tapped
  _handleMapTap(LatLng tappedPoint) {
    setState(() {
      if (_newEv) {
        myMarker = [];
        myMarker.add(Marker(
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
        ));
        updateLatLng(tappedPoint.latitude, tappedPoint.longitude);
      }
    });
  }
}

Iterable _markersToDisplay(List<Marker> myMarker, List<Marker> evMarkers) {
  List<Marker> returnList = [];
  if (_newEv) {
    returnList = myMarker;
  } else {
    returnList = evMarkers;
  }
  return returnList;
}

// load in markers on map
loadMarkers(List<Event> eventList, List<Marker> evMarkers) {
  eventList.forEach((event) {
    evMarkers.add(Marker(
      markerId: MarkerId(event.getID()),
      position: LatLng(event.getLat(), event.getLng()),
      infoWindow: InfoWindow(
          title: event.getTitle(),
          snippet: event.getAbout(),
          onTap: () {
            _handleInfoTap(event);
          }),
    ));
  });
}

_handleInfoTap(Event _event) {
  eventToShow(_event);
  _navigationService.navigateTo(routes.SingleEventRoute);
}

// change the marker for if a new event is being made
void newEvFalse() {
  _newEv = false;
}
