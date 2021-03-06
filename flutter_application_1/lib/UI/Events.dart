import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/locator.dart';
import 'package:flutter_application_1/services/navigation_service.dart';
import 'package:flutter_application_1/services/route_paths.dart' as routes;

final NavigationService _navigationService = locator<NavigationService>();

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => new _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.only(top:100),
        decoration: BoxDecoration(
          gradient: LinearGradient(
                    begin: Alignment(-1.0, -2.0),
                    end: Alignment(1.0, 2.0), 
                    colors: [
                      Color(0xffEFE2FF),
                      Color(0xff5410A3),
                    ]
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60)
            )
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 60, left: 20),
                  child: Text('Local Events', 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                    ),
                    )
                  ),
                  Container(
                    height: 20,
                    width: 70,
                    margin: EdgeInsets.only(top: 60, left: 100),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Center(child: Text("Today"))
                  )
              ],
            )
          ],),
      ),
    );
  }
}