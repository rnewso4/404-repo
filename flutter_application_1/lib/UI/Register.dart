import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/locator.dart';
import 'package:flutter_application_1/services/navigation_service.dart';
import 'package:flutter_application_1/services/route_paths.dart' as routes;

final NavigationService _navigationService = locator<NavigationService>();

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          children: <Widget>[
            textfields("Email"),
            SizedBox(height: 30),
            textfields("Password"),
            SizedBox(height: 30),
            textfields("Name"),
            SizedBox(height: 30),
            textfields("Description"),
            SizedBox(height: 30),
            textfields("Year"),
            SizedBox(height: 30),
            textfields("Major"),
            Container(
              height: 200,
              padding: EdgeInsets.only(right: 10),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 60,
                  width: 80,
                  child: GestureDetector(
                    onTap: () {
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
                                fontSize: 20,
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

textfields(String name) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: TextField(
        decoration: InputDecoration(
            labelText: name,
            labelStyle: TextStyle(
              color: Color(0xff404040),
              fontWeight: FontWeight.bold,
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff404040))))),
  );
}
