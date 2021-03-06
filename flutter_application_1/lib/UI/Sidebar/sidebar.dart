import 'dart:async';
import 'package:flutter_application_1/UI/Sidebar/menu_item.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/size_config.dart';
import 'package:flutter_application_1/services/route_paths.dart' as routes;
import 'package:flutter_application_1/main.dart';

import '../../User.dart';

User user;

///Creates the sidebar for future use if we expand on group accounts.
///Also used to log users out
///@author Bobby Newsome
class SidebarPage extends StatefulWidget {
  @override
  _SidebarPageState createState() => new _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage>
    with SingleTickerProviderStateMixin<SidebarPage> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);
  var _color;
  var _iconColor;

  //Animation controller
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  //disposes the animation
  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  //when the button is pressed the animation start
  void iconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;
    _color = Color(0xff853DD9);
    _iconColor = Color(0xffD3ADFF);
    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  void _updateAccount() async {
    Future<User> futureUser = getAccount();
    user = await futureUser;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    _updateAccount();
    String name = "Mike the Tiger";
    String email = "mtig1@lsu.edu";

    if (user != null) {
      if (user.getName() != null) {
        name = user.getName();
      } else {}
      if (user.getEmail() != null) {
        email = user.getEmail();
      } else {}
    }

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        if (!isSideBarOpenedAsync.data) {
          _color = Colors.transparent;
          _iconColor = Colors.black;
        }
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          right: isSideBarOpenedAsync.data ? 0 : -SizeConfig.screenWidth,
          left: isSideBarOpenedAsync.data ? 0 : SizeConfig.screenWidth - 45,
          child: Row(
            children: <Widget>[
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    iconPressed();
                  },
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal * 10,
                    height: SizeConfig.blockSizeVertical * 8,
                    color: _color,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: _iconColor,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                color: _color,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: SizeConfig.blockSizeHorizontal * 10),
                    firstTile(name, email),
                    dividers(),
                    MenuItemsPage(
                      icon: Icons.home,
                      title: "My Group",
                      onTap: () {
                        Navigator.of(context).pushNamed(routes.register);
                      },
                    ),
                    MenuItemsPage(
                      icon: Icons.search,
                      title: "Find Groups",
                      onTap: () {
                        Navigator.of(context).pushNamed(routes.register);
                      },
                    ),
                    MenuItemsPage(
                      icon: Icons.event_available,
                      title: "Events Signed Up",
                      onTap: () {
                        Navigator.of(context).pushNamed(routes.register);
                      },
                    ),
                    MenuItemsPage(
                      icon: Icons.add,
                      title: "Join Group",
                      onTap: () {
                        Navigator.of(context).pushNamed(routes.NewGroup);
                      },
                    ),
                    dividers(),
                    MenuItemsPage(
                      icon: Icons.exit_to_app,
                      title: "Log Off",
                      onTap: () {
                        Navigator.of(context).pushNamed(routes.LoginRoute);
                      },
                    ),
                  ],
                ),
              ))
            ],
          ),
        );
      },
    );
  }
}

//creates a divider between the main tiles and log out
dividers() {
  return Divider(
    height: SizeConfig.blockSizeVertical * 4,
    thickness: 0.5,
    color: Colors.white.withOpacity(0.3),
    indent: 32,
    endIndent: 32,
  );
}

//this is the first tile that is meant for the user account
firstTile(String name, String email) {
  return ListTile(
    title: Text(
      name,
      style: TextStyle(
          color: Colors.white,
          fontSize: SizeConfig.blockSizeHorizontal * 7,
          fontWeight: FontWeight.w800),
    ),
    subtitle: Text(
      email,
      style: TextStyle(
          color: Color(0xffD3ADFF),
          fontSize: SizeConfig.blockSizeHorizontal * 4,
          fontWeight: FontWeight.w800),
    ),
    leading: CircleAvatar(
      child: Icon(
        Icons.perm_identity,
        color: Colors.white,
      ),
      backgroundColor: Colors.grey,
      radius: 40,
    ),
  );
}
