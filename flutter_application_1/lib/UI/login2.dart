import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/route_paths.dart' as routes;
import './size_config.dart';
import './maps.dart';

final myController1 = TextEditingController();
final myController2 = TextEditingController();

class Login2 extends StatefulWidget {
  @override
  _Login2State createState() => new _Login2State();
}

class _Login2State extends State<Login2> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Color(0xFFCECECE),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
              child: Stack(children: <Widget>[
            Center(
              child: Container(
                padding:
                    EdgeInsets.only(top: SizeConfig.safeBlockVertical * 20),
                child: Text(
                  'THE',
                  style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizaontal * 10,
                    fontFamily: 'bts',
                    color: Color(0xff853DD9),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                padding:
                    EdgeInsets.only(top: SizeConfig.safeBlockVertical * 30),
                child: Text(
                  'QUAD',
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizaontal * 10,
                      fontFamily: 'bts',
                      color: Color(0xff853DD9)),
                ),
              ),
            ),
          ])),
          Container(
              padding: EdgeInsets.fromLTRB(
                  SizeConfig.blockSizeHorizaontal * 7,
                  SizeConfig.safeBlockVertical * 5,
                  SizeConfig.blockSizeHorizaontal * 7,
                  0),
              child: Column(
                children: <Widget>[
                  TextField(
                      controller: myController1,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: Color(0xff404040),
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.blockSizeHorizaontal * 4),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xff404040))))),
                  SizedBox(height: SizeConfig.safeBlockVertical * 3),
                  TextField(
                      controller: myController2,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              color: Color(0xff404040),
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.blockSizeHorizaontal * 4),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xff404040))))),
                  SizedBox(height: SizeConfig.blockSizeVertical * 3),
                  Container(
                    alignment: Alignment(1.0, 0.0),
                    padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical),
                    child: InkWell(
                        child: Text('Forgot Password',
                            style: TextStyle(
                                color: Color(0xff853DD9),
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                fontSize:
                                    SizeConfig.blockSizeHorizaontal * 3))),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 4),
                  Container(
                    height: SizeConfig.safeBlockVertical * 5,
                    child: GestureDetector(
                        onTap: () {
                          String email = myController1.text;
                          String ps = myController2.text;
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
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        SizeConfig.blockSizeHorizaontal * 5),
                              ),
                            ))),
                  ),
                ],
              )),
          //R SizedBox(height: SizeConfig.blockSizeVertical*24),
          Container(
              height: SizeConfig.safeBlockVertical * 20,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Don\'t have an accont? ',
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizaontal * 3.5),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(routes.register);
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Color(0xff853DD9),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              fontSize: SizeConfig.blockSizeHorizaontal * 3.5),
                        ),
                      )
                    ]),
              ))
        ]));
  }
}
