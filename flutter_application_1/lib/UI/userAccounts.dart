import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/size_config.dart';
import 'package:flutter_application_1/UI/Sidebar/sidebar.dart';
import 'package:flutter_application_1/main.dart';

import '../User.dart';

User user;

///this is the page where users can see their own account information, see the group notifications, and reach the aditional sidebar page
///
///@author Bobby Newsome
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
    _updateAccount();
    //Default Values
    String name = 'Mike The Tiger';
    String year = 'Senior';
    String major = 'Kineisiology';

    if (user != null) {
      if (user.getName() != null) {
        name = user.getName();
      } else {}
      if (user.getYear() != null) {
        year = user.getYear();
      } else {}
      if (user.getMajor() != null) {
        major = user.getMajor();
      } else {}
    }

    SizeConfig().init(context);
    return Scaffold(
        body: Container(
      child: Stack(children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                height: SizeConfig.blockSizeVertical * 20,
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 15),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    shape: BoxShape.circle),
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 2.6),
            Container(
              alignment: Alignment.center,
              child: Text(
                name,
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 6.7,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 3.5),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('Year',
                      style: TextStyle(
                          color: Color(0xff7B7B7B),
                          fontSize: SizeConfig.blockSizeHorizontal * 4)),
                  Text('Major',
                      style: TextStyle(
                          color: Color(0xff7B7B7B),
                          fontSize: SizeConfig.blockSizeHorizontal * 4)),
                  Text('Points',
                      style: TextStyle(
                          color: Color(0xff7B7B7B),
                          fontSize: SizeConfig.blockSizeHorizontal * 4)),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical),
            Container(
              padding: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 10,
                  right: SizeConfig.blockSizeHorizontal * 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(year,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeHorizontal * 3.8)),
                  Text(major,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeHorizontal * 3.8)),
                  Text('10,000',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeHorizontal * 3.8)),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 11),
            Container(
              padding:
                  EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 5),
              child: Text('Group Activities',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.blockSizeHorizontal * 4)),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 5),
            Container(
              height: SizeConfig.blockSizeVertical * 15,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  boxes(),
                  SizedBox(width: SizeConfig.blockSizeHorizontal * 5),
                  boxes(),
                ],
              ),
            ),
          ],
        ),
        SidebarPage(),
      ]),
    ));
  }
}

void _updateAccount() async {
  Future<User> futureUser = getAccount();
  user = await futureUser;
}

//makes one generic box for the group notifications to reuse
//@author Bobby Newsome
boxes() {
  return Container(
    height: SizeConfig.blockSizeVertical * 54,
    width: SizeConfig.blockSizeHorizontal * 48,
    margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 6),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        gradient: LinearGradient(
            begin: Alignment(-1.0, -2.0),
            end: Alignment(1.0, 2.0),
            colors: [Color(0xff7128C7), Color(0xffC7A3F0)])),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: SizeConfig.blockSizeHorizontal * 12,
              width: SizeConfig.blockSizeHorizontal * 13,
              margin: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical,
                  left: SizeConfig.blockSizeHorizontal * 2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white)),
            ),
            SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
            Text(
              'Athletics Team',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.blockSizeHorizontal * 3.5),
            )
          ],
        ),
        SizedBox(height: SizeConfig.blockSizeHorizontal * 6),
        Center(
            child: Text(
          '5 new notifications',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.blockSizeHorizontal * 3.5),
        ))
      ],
    ),
  );
}
