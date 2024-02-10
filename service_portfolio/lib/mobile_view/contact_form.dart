import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:service_portfolio/constants/const.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  @override
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void submitForm(BuildContext context) {
    if (formKey.currentState!.validate()) {
      // Upload contact form data to Firestore
      FirebaseFirestore.instance.collection('contacts').add({
        'email': emailController.text,
        'name': nameController.text,
        'message': messageController.text,
      });
    } else {
      showDialog(
          context: context,
          builder: ((context) {
            return Center(
              child: Text("error."),
            );
          }));
    }

    // Close the dialog box
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Material(
        color: kBlackColor,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.6),
                        Colors.white.withOpacity(0.1),
                      ]),
                  border: Border.all(
                      color: Colors.white.withOpacity(0.3), width: 2.0),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: height * 0.04, vertical: height * 0.06),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    const Text(
                      'Let\'s work together!',
                      style: kSubHeadingTextStyle,
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                        "We're here to provide the assurance you need and deliver results that exceed your expectations. Let's transform your vision into reality.",
                        style:
                            kParagraphTextStyle.copyWith(color: kBlackColor)),
                    const SizedBox(height: 20),
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              cursorColor: kTealColor,
                              controller: emailController,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(color: kBlackColor),
                                border: OutlineInputBorder(),
                                focusColor: kBlackColor,
                                prefixIconColor: kBlackColor,
                                prefixIcon: Icon(Icons.email),
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                              validator: (value) =>
                                  value!.isEmpty ? 'Enter an email' : null,
                            ),
                            const SizedBox(height: 10.0),
                            TextFormField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                labelText: 'Name',
                                labelStyle: TextStyle(color: kBlackColor),
                                prefixIconColor: kBlackColor,
                                border: OutlineInputBorder(),
                                focusColor: kBlackColor,
                                prefixIcon: Icon(Icons.person),
                              ),
                              validator: (value) =>
                                  value!.isEmpty ? 'Enter a name' : null,
                            ),
                            const SizedBox(height: 10.0),
                            TextFormField(
                              minLines: 3,
                              maxLines: 4,
                              controller: messageController,
                              decoration: const InputDecoration(
                                  labelText: 'Message',
                                  fillColor: kTealColor,
                                  labelStyle: TextStyle(color: kBlackColor),
                                  border: OutlineInputBorder(),
                                  focusColor: kBlackColor,
                                  prefixIconColor: kBlackColor,
                                  prefixIcon: Icon(Icons.message)),
                              validator: (value) =>
                                  value!.isEmpty ? 'Enter a message' : null,
                            ),
                          ],
                        )),
                    const SizedBox(height: 20.0),
                    MaterialButton(
                        onPressed: () => submitForm(context),
                        color: kTealColor,
                        shape: const StadiumBorder(),
                        padding: EdgeInsets.symmetric(
                            horizontal: height * 0.05, vertical: height * 0.03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Submit",
                              style: kButtonTextStyle,
                            ),
                            SizedBox(
                              width: height * 0.02,
                            ),
                            const Icon(
                              Icons.arrow_outward_rounded,
                              color: kBlackColor,
                              size: 18,
                            )
                          ],
                        )),
                  ]),
                ),
              ),
            ),
          ),
        ));
  }
}
