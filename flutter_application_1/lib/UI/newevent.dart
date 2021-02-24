import 'package:flutter/material.dart';

class NewEvent extends StatefulWidget {
  @override
  _NewEventState createState() => new _NewEventState();
}

class _NewEventState extends State<NewEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFCECECE),
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: TextStyle(
                        color: Color(0xff404040),
                        fontWeight: FontWeight.bold,
                        //fontSize: 30
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff404040))))),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Location',
                      labelStyle: TextStyle(
                        color: Color(0xff404040),
                        fontWeight: FontWeight.bold,
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff404040))))),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Account Type',
                      labelStyle: TextStyle(
                        color: Color(0xff404040),
                        fontWeight: FontWeight.bold,
                        //fontSize: 30
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff404040))))),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: TextStyle(
                        color: Color(0xff404040),
                        fontWeight: FontWeight.bold,
                        //fontSize: 30
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff404040))))),
            ),
            Container(
              height: 450,
              padding: EdgeInsets.only(right: 10),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 60,
                  width: 80,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/main');
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
