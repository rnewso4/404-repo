import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/size_config.dart';
import 'package:flutter_application_1/services/locator.dart';
import 'package:flutter_application_1/services/navigation_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_application_1/UI/maps.dart';

final NavigationService _navigationService = locator<NavigationService>();

final myController1 = TextEditingController();
final myController2 = TextEditingController();
final myController3 = TextEditingController();
final myController4 = TextEditingController();

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
                newEvFalse();
                _navigationService.goBack();
              })),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Textfields('Title', myController1),
            SizedBox(height: SizeConfig.blockSizeVertical * 2.5),
            Textfields('Start Time', myController2),
            SizedBox(height: SizeConfig.blockSizeVertical * 2.5),
            Textfields('End Time', myController2),
            SizedBox(height: SizeConfig.blockSizeVertical * 2.5),
            Textfields('Date', myController3),
            SizedBox(height: SizeConfig.blockSizeVertical * 2.5),
            Textfields('Description', myController4),
            Container(
              height: SizeConfig.blockSizeVertical * 45,
              padding:
                  EdgeInsets.only(right: SizeConfig.blockSizeHorizaontal * 3),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: SizeConfig.blockSizeVertical * 5.5,
                  width: SizeConfig.blockSizeHorizaontal * 20,
                  child: GestureDetector(
                    onTap: () {
                      //print(myController1.text);
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
                                fontSize: SizeConfig.blockSizeHorizaontal * 5,
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

updateLatLng(LatLng position) {
  String _newLat = '0';
  String _newLng = '0';
  var _latNum = double.parse(_newLat);
  var _lngNum = double.parse(_newLng);
  assert(_latNum is double);
  assert(_lngNum is double);
  _lat = _latNum;
  _lng = _lngNum;
}

Textfields(String name, var conc) {
  return Container(
    height: SizeConfig.blockSizeVertical * 7,
    child: Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.blockSizeHorizaontal * 4.5,
          right: SizeConfig.blockSizeHorizaontal * 4.5),
      child: TextField(
          controller: conc,
          decoration: InputDecoration(
              labelText: name,
              labelStyle: TextStyle(
                  color: Color(0xff404040),
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.blockSizeHorizaontal * 4),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff404040))))),
    ),
  );
}
