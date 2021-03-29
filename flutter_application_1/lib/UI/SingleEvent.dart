import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/size_config.dart';
import 'package:flutter_application_1/services/locator.dart';
import 'package:flutter_application_1/services/navigation_service.dart';
import 'package:flutter_application_1/Event.dart';
import 'package:flutter_application_1/User.dart';

final NavigationService _navigationService = locator<NavigationService>();

String _title = 'default title';
String _startTime = 'default start time';
String _endTime = 'default end time';
String _about = 'default about';
String _date = 'default date';
Event _event;
//List<User> _participants = [];      // would be needed to show participants

class SingleEventPage extends StatefulWidget {
  @override
  _SingleEventPageState createState() => new _SingleEventPageState();
}

//UI for single events page
//
//@author: Daniel W
class _SingleEventPageState extends State<SingleEventPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFCECECE),
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                _navigationService.goBack();
              })),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Title: \n'),
              Text(_title + '\n'),
              Text('Time: \n'),
              Text(_startTime + ' - ' + _endTime + '\n'),
              Text('Date: \n'),
              Text(_date + '\n'),
              Text('About: \n'),
              Text(_about + '\n'),
              Text('Participants: \n'),
              TextButton(onPressed: () {}, child: Text("Report"))
            ],
          ),
        ),
      ),
    );
  }
}

// Update what event will be showen when the page is displayed
//
//@author: Daniel W
eventToShow(Event _newEvent) {
  _event = _newEvent;
  _fillData(_event);
}

// Update the data that will be displayed
//
//@author: Daniel W
void _fillData(Event _event) {
  if (_event.getTitle() != null) {
    _title = _event.getTitle();
  }
  if (_event.getStart() != null) {
    _startTime = _event.getStart();
  }
  if (_event.getEnd() != null) {
    _endTime = _event.getEnd();
  }
  if (_event.getAbout() != null) {
    _about = _event.getAbout();
  }
  if (_event.getDate() != null) {
    _date = _event.getDate();
  }
}
