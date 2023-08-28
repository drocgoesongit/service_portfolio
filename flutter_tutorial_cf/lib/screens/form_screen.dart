import 'package:flutter/material.dart';

// Form for collecting information about employees.

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  String _email = "";
  String _password = "";

  // function to submit and validate form.
  void _submitForm() {
    final FormState? form = _formKey.currentState;
    if (!form!.validate()) {
      showMessage("Form is not valid!  Please review and correct.");
    } else {
      form.save();
      showMessage('Email: $_email\n'
          'Password: $_password\n');
    }
  }

  // functio to show message in alert dialog.
  void showMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Message"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: const Text("Form Screen")),
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Email",
                          hintText: "Enter your email",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        }
                        if (!RegExp(r'\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email address.';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _email = newValue!;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Enter your password",
                          border: const OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long.';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _password = newValue!;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _submitForm();
                        },
                        child: const Text("Submit")),
                  ]),
                ),
              ),
            )));
  }
}
