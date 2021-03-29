import 'package:flutter/widgets.dart';

///what the 
///
///author: Bobby Newsome
class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  goBack() {
    navigatorKey.currentState.pop();
  }
}