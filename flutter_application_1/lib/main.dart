import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/userAccounts.dart';
import 'package:flutter_application_1/services/locator.dart';
import 'package:flutter_application_1/services/navigation_service.dart';
import 'UI/login2.dart';
import 'UI/newevent.dart';
import 'UI/login2.dart';
import 'UI/HomeScreen.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
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
            routes: <String, WidgetBuilder> {
              '/HomeScreen': (BuildContext context) => new MyStatefulWidget()
            },
            title: "title",
            home: Login2(),
            //navigatorKey: locator<NavigationService>().navigatorKey,
          );
        }

        // TODO: create a loading screen while the app waits to connect to firebase
        return MaterialApp(
          title: "title",
          home: MyStatefulWidget(),
        );
      },
    );
  }
}