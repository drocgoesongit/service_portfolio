import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:service_portfolio/screens/home.dart';
import 'package:service_portfolio/screens/project_upload.dart';
import 'package:service_portfolio/web_view/image_upload_ui.dart';
import 'package:service_portfolio/web_view/project1_view.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Service Portfolio",
      home: HomeScreen(),
    );
  }
}
