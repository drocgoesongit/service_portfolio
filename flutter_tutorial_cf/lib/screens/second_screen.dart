import 'package:flutter/material.dart';
import 'package:flutter_tutorial_cf/screens/third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Second screen"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Second screen"),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ThirdScreen()));
              },
              color: Colors.blue,
              child: Text("Push"),
            ),
            SizedBox(
              height: 4.0,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop;
              },
              color: Colors.blue,
              child: Text("Pop"),
            ),
          ],
        )),
      ),
    );
  }
}
