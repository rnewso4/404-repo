import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/HomeScreen.dart';
import 'package:flutter_application_1/UI/Search.dart';
import 'package:flutter_application_1/UI/login2.dart';
import 'route_paths.dart' as routes;
import 'package:flutter_application_1/UI/userAccounts.dart';
import 'package:flutter_application_1/UI/newevent.dart';
import 'package:flutter_application_1/UI/loading.dart';
import 'package:flutter_application_1/UI/Search.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case routes.LoginRoute:
        return MaterialPageRoute(builder: (context) => Login2());
      case routes.NewEventRoute:
        return MaterialPageRoute(builder: (context) => NewEvent());
      case routes.HomeRoute:
        return MaterialPageRoute(builder: (context) => MyStatefulWidget());
      case routes.LoadingRoute:
        return MaterialPageRoute(builder: (context) => LoadingPage());
      case routes.SearchRoute:
        return MaterialPageRoute(builder: (context) => SeacrhPage());
      case routes.MapsRoute:
        return MaterialPageRoute(builder: (context) => SeacrhPage());
      case routes.userAccountsRoute:
        return MaterialPageRoute(builder: (context) => UserAccounts());
    }
  }
}