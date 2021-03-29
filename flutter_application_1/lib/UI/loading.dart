import 'package:flutter/material.dart';

///simple loading page for when firebase is done getting information
///
///@author Bobby Newsome
class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => new _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Loading'),),
    );
  }
}