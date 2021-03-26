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
List<User> _participants = [];
Event _event;

class SingleEventPage extends StatefulWidget {
  @override
  _SingleEventPageState createState() => new _SingleEventPageState();
}

class _SingleEventPageState extends State<SingleEventPage> {
  @override
  Widget build(BuildContext context) {
    _fillData(_event);
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Title: \n'),
            Text(_title + '\n'),
            Text('Time: \n'),
            Text(_startTime + ' - ' + _endTime + '\n'),
            Text('About: \n'),
            Text(_about + '\n'),
            Text('Participants: \n')
          ],
        ),
      ),
    );
  }
}

// Update what event will be showen when the page is displayed
eventToShow(Event _newEvent) {
  _event = _newEvent;
}

// Update the data that will be displayed
void _fillData(Event _event) {
  if (_event.getTitle() != null) {
    _title = _event.getTitle();
  } else {
    _title = 'default title';
  }
  if (_event.getStart() != null) {
    _startTime = _event.getStart();
  } else {
    _startTime = 'default start';
  }
  if (_event.getEnd() != null) {
    _startTime = _event.getEnd();
  } else {
    _startTime = 'default end';
  }
  if (_event.getAbout() != null) {
    _startTime = _event.getAbout();
  } else {
    _startTime = 'default about';
  }
}
