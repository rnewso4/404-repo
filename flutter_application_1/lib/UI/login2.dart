import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/route_paths.dart' as routes;

class Login2 extends StatefulWidget {
  @override
  _Login2State createState() => new _Login2State();
}

class _Login2State extends State<Login2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFCECECE),
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    child: Stack(children: <Widget>[
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 210),
                      child: Text(
                        'THE',
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'bts',
                          color: Color(0xff853DD9),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 300),
                      child: Text(
                        'QUAD',
                        style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'bts',
                            color: Color(0xff853DD9)),
                      ),
                    ),
                  ),
                ])),
                Container(
                    padding: EdgeInsets.fromLTRB(40, 60, 40, 0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                            decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                  color: Color(0xff404040),
                                  fontWeight: FontWeight.bold,
                                  //fontSize: 30
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff404040))))),
                        SizedBox(height: 20),
                        TextField(
                            decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: Color(0xff404040),
                                  fontWeight: FontWeight.bold,
                                  //fontSize: 30
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff404040))))),
                        SizedBox(height: 20),
                        Container(
                          alignment: Alignment(1.0, 0.0),
                          padding: EdgeInsets.only(top: 15, left: 20),
                          child: InkWell(
                              child: Text('Forgot Password',
                                  style: TextStyle(
                                      color: Color(0xff853DD9),
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline))),
                        ),
                        SizedBox(height: 50),
                        Container(
                          height: 45,
                          child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(routes.HomeRoute);
                              },
                              child: Material(
                                  borderRadius: BorderRadius.circular(20),
                                  shadowColor: Color(0xff853DD9),
                                  color: Color(0xff853DD9),
                                  elevation: 4.0,
                                  child: Center(
                                    child: Text(
                                      'LOGIN',
                                      style: TextStyle(
                                          color: Color(0xFFEBEBEB),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ))),
                        ),
                      ],
                    )),
                Container(
                    height: 200,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Don\'t have an accont? '),
                            InkWell(
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: Color(0xff853DD9),
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ]),
                    ))
              ]),
        ));
  }
}
