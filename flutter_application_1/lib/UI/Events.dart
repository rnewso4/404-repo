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
      resizeToAvoidBottomInset: false,
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
                /*  Container(
                    height: 20,
                    width: 70,
                    margin: EdgeInsets.only(top: 60, left: 100),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Center(child: Text("Today"))
                  ) */
              ],
            ),
            Expanded(
              child: ListView( 
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                SizedBox(height: 30),
                events(),
                SizedBox(height: 30),
                events(),
                SizedBox(height: 30),
                events(),
                SizedBox(height: 30),
                events(),
                SizedBox(height: 30),
                ],),
            ),
          ],),
      ),
    );
  }
}

events() {
  return Container(
      height: 150,
      width: 10,
      margin: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white
      ),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Event',
                style: TextStyle(
                  fontSize: 30,
                )
                ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Text('text')
              )
          ),
          Container(
            height: 66,
            padding: EdgeInsets.only(bottom: 10, left: 15),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: <Widget>[
                  Text('User Name                                                 '),
                  InkWell(
                      child: Text('Report',
                      style: TextStyle(
                          color: Color(0xff853DD9),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline))),
                ],
              ),
            ),
          )
        ],
        ),
    );
}