import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/size_config.dart';
import 'package:flutter_application_1/services/locator.dart';
import 'package:flutter_application_1/services/navigation_service.dart';
import 'package:flutter_application_1/services/route_paths.dart' as routes;
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/UI/SingleEvent.dart';

import '../Event.dart';

final NavigationService _navigationService = locator<NavigationService>();
List<Event> eventList;

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => new _EventsPageState();
  final myController = TextEditingController();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var name = new List(9);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(-1.0, -2.0),
                end: Alignment(1.0, 2.0),
                colors: [
                  Color(0xffF7E8FF),
                  Color(0xff5410A3),
                ]),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60), topRight: Radius.circular(60))),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(
                        top: SizeConfig.blockSizeHorizontal * 10,
                        left: SizeConfig.blockSizeHorizontal * 5),
                    child: Text(
                      'Local Events',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.blockSizeHorizontal * 7,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 2),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: name.length,
                  itemBuilder: (context, index) {
                    return Card(
                        //elevation: 0.0,
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 4,
                            right: SizeConfig.blockSizeHorizontal * 4,
                            bottom: SizeConfig.blockSizeVertical * 3),
                        child: events());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

void _updateList() async {
  Future<List<Event>> futureList = getEvents();
  eventList = await futureList;
}

events() {
  _updateList();
  return TextButton(
    onPressed: () {
      //eventToShow()
      _navigationService.navigateTo(routes.SingleEventRoute);
    },
    style: ButtonStyle(
        //padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(color: Colors.white)))),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: SizeConfig.blockSizeVertical * 10,
          width: SizeConfig.blockSizeHorizontal * 20,
          padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2.5),
          decoration: BoxDecoration(
              border: Border(
            right: BorderSide(
                width: SizeConfig.blockSizeHorizontal * .3,
                color: Colors.black),
          )),
          child: Column(
            children: <Widget>[
              Text(
                //eventList[0].getStart()
                '7:00',
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 6,
                    color: Color(0xff404040)),
              ),
              //SizedBox(height: SizeConfig.blockSizeVertical),
              Text(
                'AM',
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 4,
                    color: Color(0xff404040)),
              ),
            ],
          ),
        ),
        Container(
          height: SizeConfig.blockSizeVertical * 10,
          width: SizeConfig.blockSizeHorizontal * 58,
          margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 2),
          child: Row(children: <Widget>[
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: SizeConfig.blockSizeVertical * 10 / 3,
                    padding:
                        EdgeInsets.only(top: SizeConfig.blockSizeVertical * .5),
                    child: Text('Title',
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 6,
                            color: Color(0xff404040))),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      height: SizeConfig.blockSizeVertical * 10 / 3,
                      padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 1.9),
                      child: Text('Location',
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3,
                              color: Color(0xff404040))),
                    ),
                  ),
                  Container(
                    height: SizeConfig.blockSizeVertical * 10 / 3,
                    padding: EdgeInsets.only(
                        bottom: SizeConfig.blockSizeVertical * 0.5),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text('User name',
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3,
                              color: Color(0xff404040))),
                    ),
                  ),
                ]),
          ]),
        )
      ],
    ),
  );
}
