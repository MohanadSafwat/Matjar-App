import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'signUp.dart';
import 'home.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _init = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: Colors.red[700],
            body: Center(
              child: Text(
                "Error:${snapshot.error}",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                User user = snapshot.data;
                if (user == null) {
                  return SignUp();
                } else {
                  return HomePage();
                }
              }

              return Scaffold(
                backgroundColor: Colors.red[700],
                body: Center(
                  child: Text(
                    "Matjar",
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: "DancingScript",
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          );
        }
        return Scaffold(
          backgroundColor: Colors.red[700],
          body: Center(
            child: Text(
              "Matjar",
              style: TextStyle(
                fontSize: 40,
                fontFamily: "DancingScript",
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
