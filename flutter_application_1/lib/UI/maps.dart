import 'package:flutter/material.dart';
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
List<Event> eventList;
List<Marker> evMarkers = [];

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => new _MapsPageState();
}

void _updateList() async {
  Future<List<Event>> futureList = getEvents();
  eventList = await futureList;
}

class _MapsPageState extends State<MapsPage> {
  List<Marker> myMarker = [];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(30.4126, -91.1771), zoom: 16),
            markers: Set.from(myMarker),
            onTap: _handleTap,
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
                      left: SizeConfig.blockSizeHorizaontal * 14,
                      right: SizeConfig.blockSizeHorizaontal * 8,
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
                            left: SizeConfig.blockSizeHorizaontal * 2.3,
                            top: SizeConfig.blockSizeVertical * 1.5),
                        child: Text(
                          'Q',
                          style: TextStyle(
                              fontFamily: 'bts',
                              color: Color(0xff853DD9),
                              fontSize: SizeConfig.blockSizeHorizaontal * 2.7),
                        ),
                      ),
                      Text(
                        '   Search here',
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizaontal * 3.5),
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
                  right: SizeConfig.blockSizeHorizaontal * 2.3,
                  bottom: SizeConfig.blockSizeVertical * 12),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  child: Icon(Icons.add,
                      size: SizeConfig.blockSizeHorizaontal * 12),
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
  _handleTap(LatLng tappedPoint) {
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

// load in markers on map
void loadMarkers() {
  _updateList();
  // for every event to load in
  eventList.forEach((event) {
    evMarkers.add(Marker(
      markerId: MarkerId(event.getID()),
      onTap: () {}, //maybe giving the option to see some info about the event
      position: LatLng(event.getLat(), event.getLng()),
    ));
  });
}

// change the marker for if a new event is being made
void newEvFalse() {
  _newEv = false;
}
