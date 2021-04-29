import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class LandingScreen extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Container(
                child: Text("Error  ${snapshot.error}"),
              ),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            body: Center(
              child: Container(
                child: Text('Firebase App Initialized Successfully'),
              ),
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold(
          body: Center(
            child: Container(
              child: Text('Waiting ...'),
            ),
          ),
        );
      },
    );
  }
}
