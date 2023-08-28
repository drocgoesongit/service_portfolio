import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Third screen"),
        ),
        body: Center(
            child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Third screen"),
            MaterialButton(
              onPressed: () {},
              color: Colors.blue,
              child: Text("Pop"),
            ),
          ],
        )),
      ),
    );
  }
}
