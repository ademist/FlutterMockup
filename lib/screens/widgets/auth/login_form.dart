import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _value = '';

  void _passValueToParent() {
    // Call the callback function and pass the value
    // widget.onValueReceived(_value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Your login form UI code goes here
      child: TextButton(
        onPressed: _passValueToParent,
        child: Text('Pass Value to Parent'),
      ),
    );
  }
}