import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/HomeScreen.dart';
import 'package:flutter_application_1/UI/Register.dart';
import 'package:flutter_application_1/UI/Search.dart';
import 'package:flutter_application_1/UI/login2.dart';
import 'package:flutter_application_1/UI/maps.dart';
import 'route_paths.dart' as routes;
import 'package:flutter_application_1/UI/userAccounts.dart';
import 'package:flutter_application_1/UI/newevent.dart';
import 'package:flutter_application_1/UI/loading.dart';
import 'package:flutter_application_1/UI/Events.dart';
import 'package:flutter_application_1/UI/SingleEvent.dart';
import 'package:flutter_application_1/UI/newGroup.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routes.LoginRoute:
        return MaterialPageRoute(builder: (context) => Login2());
      case routes.NewEventRoute:
        return MaterialPageRoute(builder: (context) => NewEvent());
      case routes.SingleEventRoute:
        return MaterialPageRoute(builder: (context) => SingleEventPage());
      case routes.HomeRoute:
        return MaterialPageRoute(builder: (context) => MyStatefulWidget());
      case routes.LoadingRoute:
        return MaterialPageRoute(builder: (context) => LoadingPage());
      case routes.SearchRoute:
        return MaterialPageRoute(builder: (context) => SeacrhPage());
      case routes.MapsRoute:
        return MaterialPageRoute(builder: (context) => MapsPage());
      case routes.register:
        return MaterialPageRoute(builder: (context) => RegisterPage());
      case routes.NewGroup:
        return MaterialPageRoute(builder: (context) => NewGroup());
    }
  }
}
