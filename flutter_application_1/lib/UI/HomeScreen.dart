import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Stack(
      children: <Widget>[
        GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(30.4133, -91.1800),
          zoom: 15
          )
        ),
        Container(
          padding: EdgeInsets.only(left: 60, right: 30, top: 50),
          child: Align(
            alignment: Alignment.topCenter,
              child: TextField(
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[800]),
                hintText: "Type in your text",
                fillColor: Colors.white70),
              ),
          )
        ),
        Container(
          height: 700,
          padding: EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              child: Icon(Icons.add, size: 50),
              backgroundColor: Colors.white,
              foregroundColor: Color(0xff853DD9),
              onPressed: () {},
            ),
          ),
        )
      ],
    ),
    Container(
      color: Colors.amber,
    ),
    Container()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        //title: const Text('The Quad'),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
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
