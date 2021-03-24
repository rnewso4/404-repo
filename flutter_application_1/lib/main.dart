import 'package:flutter/material.dart';
import 'package:flutter_application_1/Event.dart';
import 'package:flutter_application_1/UI/Register.dart';
import 'package:flutter_application_1/services/locator.dart';
import 'package:flutter_application_1/services/navigation_service.dart';
import 'package:flutter_application_1/services/route_generator.dart';
import 'package:flutter_application_1/services/route_paths.dart' as routes;
import 'package:flutter_application_1/UI/loading.dart';

import 'Account.dart';
import 'User.dart';
import 'Group.dart';
import 'AuthenticationServices.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

void genUser(String email, String ps, String name, String des, String year,
    String major) {
  var user = new User(email, ps, name, des, year, major);
  AuthenticationServices().createAccount(user);
}

void genEvent(String name, String about, String start, String end, String date,
    double lat, double log) {
  var event = new Event(name, about, start, end, date, lat, log);
  event.createEvent();
  print("Event Created");
}

void genGroup(String name, String des) {
  var group = new Group(name, des);
}

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
