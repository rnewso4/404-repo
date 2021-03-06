import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/locator.dart';
import 'package:flutter_application_1/services/navigation_service.dart';
import 'package:flutter_application_1/services/route_paths.dart' as routes;

final NavigationService _navigationService = locator<NavigationService>();

class UserAccounts extends StatefulWidget {
  @override
  _UserAccountsState createState() => _UserAccountsState();
}

class _UserAccountsState extends State<UserAccounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomInset: false,
        appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
          icon: Icon(Icons.settings), 
          onPressed: () {} 
          )
        ]
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  height: 160,
                  margin: EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    shape: BoxShape.circle
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Mike The Tiger',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 35),
              Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('Year', style: TextStyle(color: Color(0xff7B7B7B))),
                      Text('Major', style: TextStyle(color: Color(0xff7B7B7B))),
                      Text('Points', style: TextStyle(color: Color(0xff7B7B7B))),
                    ],
                  ),
                ),
              SizedBox(height: 9),
              Container(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Senior', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Kineisiology', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('10,000', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              SizedBox(height: 100),
              Container(
                padding: EdgeInsets.only(left: 15),
                child: Text('Group Activities', style: TextStyle(fontWeight: FontWeight.bold)),
              ), 
              SizedBox(height: 50),
              Container(
                height: 125,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                        boxes(),
                        SizedBox(width: 20),
                        boxes(),
                    ],
                  ),
                ),
              //)
            ],
          ),
        ));
  }
}

boxes() {
  return Container(
                height: 130,
                width: 200,
                margin: EdgeInsets.only(left: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  gradient: LinearGradient(
                    begin: Alignment(-1.0, -2.0),
                    end: Alignment(1.0, 2.0), 
                    colors: [
                      Color(0xff7128C7),
                      Color(0xffC7A3F0)
                    ]
                    )
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 60,
                          margin: EdgeInsets.only(top: 8, left: 5),
                          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white)),
                        ),
                        SizedBox(width: 2),
                        Text(
                          'Athletics Team',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                          )
                      ],),
                    SizedBox(height: 30),
                    Center(
                      child: Text(
                        '5 new notifications',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                        )
                    )
                  ],
                ),
              );
}