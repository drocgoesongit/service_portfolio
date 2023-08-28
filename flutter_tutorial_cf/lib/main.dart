import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial_cf/screens/first_screen.dart';
import 'package:flutter_tutorial_cf/screens/form_screen.dart';
import 'package:flutter_tutorial_cf/screens/form_short.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyAdhQmjXcD99A-c-cFa8jMMprKeB7zFNkg",
    authDomain: "trial-b2776.firebaseapp.com",
    projectId: "trial-b2776",
    storageBucket: "trial-b2776.appspot.com",
    messagingSenderId: "777191802998",
    appId: "1:777191802998:web:ab40eda3ad41feee547757",
    measurementId: "G-KFRRQ8PBCS",
  ));

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return FormScreen();
          }
          if (snapshot.hasError) {
            return const Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
