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
import 'package:flutter_application_1/Event.dart';

final NavigationService _navigationService = locator<NavigationService>();
bool _newEv = false;

///uses google maps api key to get the google maps where users can place pins and see events in a location based interface
///
///@author Bobby Newsome
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
  //
//@author: Daniel W
  void _newEvTrue() {
    _newEv = true;
  }

  // what to do when the map is tapped
  //
//@author: Daniel W
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

//determins which set of markers will be displayed
//
//@author: Daniel W
Iterable _markersToDisplay(List<Marker> myMarker, List<Marker> evMarkers) {
  List<Marker> returnList = [];
  if (_newEv) {
    returnList = myMarker;
  } else {
    returnList = evMarkers;
  }
  return returnList;
}

// fill marker list and give them required info
//
//@author: Daniel W
loadMarkers(List<Event> eventList, List<Marker> evMarkers) {
  eventList.forEach((event) {
    evMarkers.add(Marker(
      markerId: MarkerId(event.getID()),
      position: LatLng(_getMarkerLat(event), _getMarkerLng(event)),
      infoWindow: InfoWindow(
          title: _getMarkerTitle(event),
          snippet: _getMarkerAbout(event),
          onTap: () {
            _handleInfoTap(event);
          }),
    ));
  });
}

//return lat of event or 0 if the lat was not assigned
//
//@author: Daniel W
double _getMarkerLat(Event _event) {
  double retVal;
  if (_event.getLat() != null) {
    retVal = _event.getLat();
  } else {
    retVal = 0;
  }
  return retVal;
}

//return lng of event or 0 if the lat was not assigned
//
//@author: Daniel W
double _getMarkerLng(Event _event) {
  double retVal;
  if (_event.getLng() != null) {
    retVal = _event.getLng();
  } else {
    retVal = 0;
  }
  return retVal;
}

//return Title of event or default title if the title was not assigned
//
//@author: Daniel W
String _getMarkerTitle(Event _event) {
  String retVal;
  if (_event.getTitle() != null) {
    retVal = _event.getTitle();
  } else {
    retVal = "Default Title";
  }
  return retVal;
}

//return Title of event or default title if the title was not assigned
//
//@author: Daniel W
String _getMarkerAbout(Event _event) {
  String retVal;
  if (_event.getAbout() != null) {
    retVal = _event.getAbout();
  } else {
    retVal = "Default About";
  }
  return retVal;
}

//when info window is tapped go to single event page to showmore info about that event
//
//@author: Daniel W
_handleInfoTap(Event _event) {
  eventToShow(_event);
  _navigationService.navigateTo(routes.SingleEventRoute);
}

// change the marker for if a new event is not being made
//
//@author: Daniel W
void newEvFalse() {
  _newEv = false;
}
