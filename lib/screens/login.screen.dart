import 'package:flutter/material.dart';

class Login extends StatefulWidget {

  static const id = 'login_screen';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Login Screen',
          style: TextStyle(
            color: Colors.white
          ),
        )
      )
    );
  }
}