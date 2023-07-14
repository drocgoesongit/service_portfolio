import 'package:flutter/material.dart';
import 'package:service_portfolio/mobile_view/home_mobile.dart';
import 'package:service_portfolio/web_view/home_web.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (builder, constraints) {
        if (constraints.maxWidth < 600) {
          return HomeMobile();
        } else {
          return HomeScreenWeb();
        }
      }),
    );
  }
}
