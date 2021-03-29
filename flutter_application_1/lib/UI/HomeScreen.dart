import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/Events.dart';
import 'package:flutter_application_1/UI/maps.dart';
import 'package:flutter_application_1/UI/userAccounts.dart';


/// This is the home screen of the app. Based on the integer number, the state of the app changes between the three main home pages
/// Also includes the bottom navigation bar
/// 
/// @author Bobby Newsome
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    MapsPage(),
    EventsPage(),
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
