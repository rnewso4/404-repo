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
          height: 30,
          margin: EdgeInsets.only(left: 60, right: 30, top: 50),
          decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(360)),
                ),
              child: GestureDetector(
                onTap: () {},
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10, top: 9),
                        child: Text(
                          'Q',
                          style: TextStyle(
                            fontFamily: 'bts',
                            color: Color(0xff853DD9),
                            fontSize: 9
                          ),
                        ),
                      ),
                      Text('   Search here')
                    ],
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
