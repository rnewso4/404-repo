import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/Search.dart';
import 'package:flutter_application_1/UI/maps.dart';
import 'package:flutter_application_1/UI/userAccounts.dart';


/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    MapsPage(),
    SeacrhPage(),
    UserAccounts()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      //appBar: AppBar(
        ////title: const Text('The Quad'),
       // iconTheme: IconThemeData(color: Colors.black),
        //elevation: 0.0,
        //backgroundColor: Colors.transparent,
      //),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Accounts',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff853DD9),
        onTap: _onItemTapped,
      ),
    );
  }
}
