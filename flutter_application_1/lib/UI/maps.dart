import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_application_1/services/locator.dart';
import 'package:flutter_application_1/services/navigation_service.dart';
import 'package:flutter_application_1/services/route_paths.dart' as routes;

final NavigationService _navigationService = locator<NavigationService>();

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => new _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      //clipBehavior: Clip.none,
      children: <Widget>[
        GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(30.4133, -91.1800),
          zoom: 15
          )
        ),
        //-------------------PAGE 1--------------------------------
        Container(
          height: 700,
          padding: EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              child: Icon(Icons.add, size: 50),
              backgroundColor: Colors.white,
              foregroundColor: Color(0xff853DD9),
              onPressed: () {_navigationService.navigateTo(routes.NewEventRoute);},
            ),
          ),
        ),
        SizedBox(
          //width: double.infinity,
          //height: 200,
          child: GestureDetector(
            onTap: () {_navigationService.navigateTo(routes.SearchRoute);},
            behavior: HitTestBehavior.translucent,
            child: Container(
              height: 30,
              margin: EdgeInsets.only(left: 60, right: 30, top: 50),
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
                            padding: EdgeInsets.only(left: 10, top: 9),
                            child: Text(
                              'Q',
                              style: TextStyle(
                                fontFamily: 'bts',
                                color: Color(0xff853DD9),
                                fontSize: 9
                              ),
                            ),
                          ),
                          Text('   Search here')
                        ],
                    ),
                  )
              ),
        ),
      ],
    ),
    );
  }
}