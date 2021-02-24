import 'package:flutter/material.dart';

class UserAccounts extends StatefulWidget{
  @override
  _UserAccountsState createState() => _UserAccountsState();
}

class _UserAccountsState extends State<UserAccounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              height: 160,
              margin: EdgeInsets.fromLTRB(130, 200, 130, 0),
              decoration: BoxDecoration(
                border: Border.all(
                color: Colors.black,
                ),
                borderRadius: BorderRadius.all(Radius.circular(360)),
              ),
            ),
          SizedBox(height: 30),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Mike The Tiger',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('Year'),
                Text('Major'),
                Text('Points'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 50, right: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Senior'),
                Text('Kineisiology'),
                Text('10,000'),
              ],
            ),
          ),
          SizedBox(height: 100),
          Container(
            child: Text(
              'Group Activities'
            ),
          )
        ],
      )
    );
  }
}