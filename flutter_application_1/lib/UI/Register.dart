import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/size_config.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/services/locator.dart';
import 'package:flutter_application_1/services/navigation_service.dart';
import 'package:flutter_application_1/services/route_paths.dart' as routes;

final NavigationService _navigationService = locator<NavigationService>();
final myController1 = TextEditingController();
final myController2 = TextEditingController();
final myController3 = TextEditingController();
final myController4 = TextEditingController();
final myController5 = TextEditingController();
final myController6 = TextEditingController();

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            textfields("Email", myController1),
            SizedBox(height: SizeConfig.blockSizeVertical * 2.5),
            textfields("Password", myController2),
            SizedBox(height: SizeConfig.blockSizeVertical * 2.5),
            textfields("Name", myController3),
            SizedBox(height: SizeConfig.blockSizeVertical * 2.5),
            textfields("Description", myController4),
            SizedBox(height: SizeConfig.blockSizeVertical * 2.5),
            textfields("Year", myController5),
            SizedBox(height: SizeConfig.blockSizeVertical * 2.5),
            textfields("Major", myController6),
            Container(
              height: SizeConfig.blockSizeVertical * 25,
              padding:
                  EdgeInsets.only(right: SizeConfig.blockSizeHorizaontal * 4),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: SizeConfig.blockSizeVertical * 6,
                  width: SizeConfig.blockSizeHorizaontal * 20,
                  child: GestureDetector(
                    onTap: () {
                      String input1 = myController1.text;
                      String input2 = myController2.text;
                      String input3 = myController3.text;
                      String input4 = myController4.text;
                      String input5 = myController5.text;
                      String input6 = myController6.text;
                      genUser(input1, input2, input3, input4, input5, input5);

                      Navigator.of(context).pushNamed(routes.HomeRoute);
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

textfields(String name, var conc) {
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
