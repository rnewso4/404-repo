import 'package:flutter/material.dart';
import 'package:flutter_application_1/Event.dart';
import 'package:flutter_application_1/UI/Register.dart';
import 'package:flutter_application_1/services/locator.dart';
import 'package:flutter_application_1/services/navigation_service.dart';
import 'package:flutter_application_1/services/route_generator.dart';
import 'package:flutter_application_1/services/route_paths.dart' as routes;
import 'package:flutter_application_1/UI/loading.dart';

import 'User.dart';
import 'Group.dart';
import 'AuthenticationServices.dart';
import 'Event.dart';
import 'DataServices.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

/**
   * This class runs the app and initializes all features
   * 
   * @author
   * commented by: Daniel Ahmed
   */

void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}
/**
     * This method is for the creation of accounts
     * 
     * routine: genUser
     * 
     * return type: void
     * 
     * parameters
     *    email [String] used in creation of user/acc
     *    ps [String] used in creation of user/acc
     *    name [String] used in creation of user/acc
     *    des [String] used in creation of user/acc
     *    year [String] used in creation of user/acc
     * @author: 
     */

void genUser(String email, String ps, String name, String des, String year,
    String major) {
  var user = new User(email, ps, name, des, year, major);
  AuthenticationServices().createAccount(user);
}

/**
     * This method is for creation of events from users
     * 
     * routine: genEvent
     * 
     * return type: void
     * 
     * parameters
     *    name [String] used in creation of event
     *    about [String] used in creation of event
     *    start [String] used in creation of event
     *    end [String] used in creation of event
     *    date [String] used in creation of event
     * @author: 
     */

void genEvent(String name, String about, String start, String end, String date,
    double lat, double log) {
  var event = new Event(name, about, start, end, date, lat, log);
  event.createEvent();
}

/**
     * This method is for creation of events from users
     * 
     * routine: genGroup
     * 
     * return type: void
     * 
     * parameters
     *    name [String] used in creation of event
     *    des [String] used in creation of event
     * @author: 
     */

void genGroup(String name, String des) {
  var group = new Group(name, des);
}
/**
     * This method is for creation of events from users
     * 
     * routine: getEvents
     * 
     * return type: List<Event>
     * 
     * @author: 
     */

Future<List<Event>> getEvents() {
  return DataServices().getCurrentEvents();
}

/**
     * This method is for creation of events from users
     * 
     * routine: getAccount
     * 
     * return type: User
     * 
     * @author: 
     */
Future<User> getAccount() {
  return AuthenticationServices().getCurrentUser();
}

/**
     * This class is for deployment of the application
     * which will show your application/send you to the title screen
     * 
     * routine: App
     * 
     * return type: N/A
     * 
     * @author: Bobby Newsome
     */
class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        // if (snapshot.hasError) {
        //   return SomethingWentWrong();
        // }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: "title",
            onGenerateRoute: RouteGenerator.generateRoute,
            initialRoute: routes.LoginRoute,
            navigatorKey: locator<NavigationService>().navigatorKey,
          );
        }

        // TODO: create a loading screen while the app waits to connect to firebase
        return MaterialApp(
          title: "title",
          home: LoadingPage(),
        );
      },
    );
  }
}
