import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/size_config.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/services/locator.dart';
import 'package:flutter_application_1/services/navigation_service.dart';
import 'package:flutter_application_1/UI/maps.dart';

final NavigationService _navigationService = locator<NavigationService>();

final myController1 = TextEditingController();
final myController2 = TextEditingController();
final myController3 = TextEditingController();
final myController4 = TextEditingController();
final myController5 = TextEditingController();

double _lat; //these can be moved if needed
double _lng; //these can be moved if needed

class NewEvent extends StatefulWidget {
  @override
  _NewEventState createState() => new _NewEventState();
}

class _NewEventState extends State<NewEvent> {
  //@override
  //void dispose() {
  // Clean up the controller when the widget is disposed.
  //myController.dispose();
  //super.dispose();
  // }
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
                //newEvFalse();
                _navigationService.goBack();
              })),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Textfields('Title', myController1),
            SizedBox(height: SizeConfig.blockSizeVertical * 2.5),
            Textfields('Start Time', myController2),
            SizedBox(height: SizeConfig.blockSizeVertical * 2.5),
            Textfields('End Time', myController3),
            SizedBox(height: SizeConfig.blockSizeVertical * 2.5),
            Textfields('Date', myController4),
            SizedBox(height: SizeConfig.blockSizeVertical * 2.5),
            Textfields('Description', myController5),
            Container(
              height: SizeConfig.blockSizeVertical * 45,
              padding:
                  EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 3),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: SizeConfig.blockSizeVertical * 5.5,
                  width: SizeConfig.blockSizeHorizontal * 20,
                  child: GestureDetector(
                    onTap: () {
                      newEvFalse();
                      var title = myController1.text;
                      var des = myController5.text;
                      var stTime = myController2.text;
                      var enTime = myController3.text;
                      var date = myController4.text;

                      genEvent(title, des, stTime, enTime, date, _lat, _lng);

                      _navigationService.goBack();
                    },
                    child: Material(
                        borderRadius: BorderRadius.circular(30),
                        shadowColor: Color(0xff853DD9),
                        color: Color(0xff853DD9),
                        elevation: 4.0,
                        child: Center(
                          child: Text(
                            'ADD',
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 5,
                                color: Color(0xFFEBEBEB),
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

updateLatLng(double newLat, double newLng) {
  _lat = newLat;
  _lng = newLng;
}

Textfields(String name, var conc) {
  return Container(
    height: SizeConfig.blockSizeVertical * 7,
    child: Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.blockSizeHorizontal * 4.5,
          right: SizeConfig.blockSizeHorizontal * 4.5),
      child: TextField(
          controller: conc,
          decoration: InputDecoration(
              labelText: name,
              labelStyle: TextStyle(
                  color: Color(0xff404040),
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.blockSizeHorizontal * 4),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff404040))))),
    ),
  );
}
