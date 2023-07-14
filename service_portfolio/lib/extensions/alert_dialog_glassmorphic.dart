import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:service_portfolio/constants/const.dart';

class GlassmorphicAlertDialog extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  void submitForm(BuildContext context) {
    // Upload contact form data to Firestore
    FirebaseFirestore.instance.collection('contacts').add({
      'email': emailController.text,
      'name': nameController.text,
      'message': messageController.text,
    });

    // Close the dialog box
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      content: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          width: width * 0.6,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.6),
                  Colors.white.withOpacity(0.1),
                ]),
            border:
                Border.all(color: Colors.white.withOpacity(0.3), width: 2.0),
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: height * 0.04, vertical: height * 0.06),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Let\'s work together!',
                  style: kSubHeadingTextStyle,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Enter an email' : null,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                  validator: (value) => value!.isEmpty ? 'Enter a name' : null,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  minLines: 3,
                  maxLines: 4,
                  controller: messageController,
                  decoration: InputDecoration(
                    labelText: 'Message',
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Enter a message' : null,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () => submitForm(context),
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Set your desired button color
                    minimumSize: Size(double.infinity, 50.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
