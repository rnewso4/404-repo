import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/size_config.dart';
import 'package:flutter_application_1/UI/Sidebar/sidebar.dart';
import 'package:flutter_application_1/services/locator.dart';
import 'package:flutter_application_1/services/navigation_service.dart';
import 'package:flutter_application_1/services/route_paths.dart' as routes;

final NavigationService _navigationService = locator<NavigationService>();

class UserAccounts extends StatefulWidget {
  @override
  _UserAccountsState createState() => _UserAccountsState();
}

class _UserAccountsState extends State<UserAccounts> {
  /*
  String valuechoose;
  List listitem = ["item 1", "item 2"];
*/
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /*DropdownButton(
                  value: valuechoose,
                  onChanged: (newValue) {
                    setState(() {
                      valuechoose = newValue;
                    }
                    );
                      if (newValue.contains("item 1")) {
                        Navigator.of(context).pushNamed(routes.register);
                      }
                      if (newValue.contains("item 2")) {
                        Navigator.of(context).pushNamed(routes.HomeRoute);
                      }
                  },
                  items: listitem.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                ), */
                Center(
                  child: Container(
                    height: SizeConfig.blockSizeVertical*20,
                    margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical*15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      shape: BoxShape.circle
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical*2.6),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Mike The Tiger',
                    style: TextStyle(fontSize: SizeConfig.blockSizeHorizaontal*6.7, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical*3.5),
                Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Year', style: TextStyle(
                          color: Color(0xff7B7B7B),
                          fontSize: SizeConfig.blockSizeHorizaontal*4)),
                        Text('Major', style: TextStyle(
                          color: Color(0xff7B7B7B),
                          fontSize: SizeConfig.blockSizeHorizaontal*4)),
                        Text('Points', style: TextStyle(
                          color: Color(0xff7B7B7B),
                          fontSize: SizeConfig.blockSizeHorizaontal*4)),
                      ],
                    ),
                  ),
                SizedBox(height: SizeConfig.blockSizeVertical),
                Container(
                    padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizaontal*10, right: SizeConfig.blockSizeHorizaontal*10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Senior', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeHorizaontal*3.8)),
                        Text('Kineisiology', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeHorizaontal*3.8)),
                        Text('10,000', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeHorizaontal*3.8)),
                      ],
                    ),
                  ),
                SizedBox(height: SizeConfig.blockSizeVertical*11),
                Container(
                  padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizaontal*5),
                  child: Text('Group Activities', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.blockSizeHorizaontal*4)),
                ), 
                SizedBox(height: SizeConfig.blockSizeVertical*5),
                Container(
                  height: SizeConfig.blockSizeVertical*15,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                          boxes(),
                          SizedBox(width: SizeConfig.blockSizeHorizaontal*5),
                          boxes(),
                      ],
                    ),
                  ),
              ],
            ),
            SidebarPage(),
            ]),
        )
        );
  }
}

boxes() {
  return Container(
                height: SizeConfig.blockSizeVertical*54,
                width: SizeConfig.blockSizeHorizaontal*48,
                margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizaontal*6),
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
                          height: SizeConfig.blockSizeHorizaontal*12,
                          width: SizeConfig.blockSizeHorizaontal*13,
                          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical, left: SizeConfig.blockSizeHorizaontal*2),
                          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white)),
                        ),
                        SizedBox(width: SizeConfig.blockSizeHorizaontal*2),
                        Text(
                          'Athletics Team',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.blockSizeHorizaontal*3.5
                          ),
                          )
                      ],),
                    SizedBox(height: SizeConfig.blockSizeHorizaontal*6),
                    Center(
                      child: Text(
                        '5 new notifications',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeHorizaontal*3.5
                        ),
                        )
                    )
                  ],
                ),
              );
}