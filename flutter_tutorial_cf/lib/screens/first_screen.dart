import 'package:flutter/material.dart';
import 'package:flutter_tutorial_cf/screens/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.blue[300],
          child: Column(children: [
            Image.asset('assets/images/rashyimage.jpg'),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondScreen()));
                },
                child: const Text("Second Screen")),
            const SizedBox(
              height: 10.0,
            ),
            const Text("Third Screen"),
          ]),
        ),
        appBar: AppBar(
          title: const Text("First Screen"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("First Screen"),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondScreen()));
              },
              color: Colors.blue,
              child: const Text("Go to second Screen"),
            )
          ],
        )),
      ),
    );
  }
}
