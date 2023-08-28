import 'package:flutter/material.dart';

class ShortForm extends StatefulWidget {
  ShortForm({super.key});

  @override
  State<ShortForm> createState() => _ShortFormState();
}

class _ShortFormState extends State<ShortForm> {
  final _formKey = GlobalKey<FormState>();

  String _email = "";
  String _password = "";

  void onSave() {
    final FormState? form = _formKey.currentState;
    if (!form!.validate()) {
      showMessage("Form is not valid!  Please review and correct.");
    } else {
      form.save();
      showMessage("Email: $_email, Password: $_password");
    }
  }

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
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
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
                  setState(() => _email = newValue!);
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  if (value.length < 8) {
                    return 'Please enter password more than 8 characters.';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  setState(() => _password = newValue!);
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              MaterialButton(
                onPressed: () {
                  onSave();
                },
                color: Colors.blue,
                child: const Text("Submit"),
              ),
            ]),
          )),
    );
  }
}
